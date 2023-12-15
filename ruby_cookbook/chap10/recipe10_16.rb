# Enforcing Software Contracts
# Problem:
# You want your methods to validate their arguments, using techniques like duck typing and
# range validation, without filling your code with tons of conditions to test arguments.


module Contracts
  # This method defines a contract based on input
  def valid_contract(input)
    # User defined contracts take precedence
    return @user_defined[input] if @user_defined && @user_defined[input]

    # Standard contracts
    case input
    when :number
      lambda { |x| x.is_a? Numeric }
    when :string
      lambda { |x| x.respond_to? :to_str }
    when :anything
      lambda { |_| true }
    else
      lambda { |_| false }
    end
  end

  # Custom exception for contract violations
  class ContractViolation < StandardError; end

  # Define custom data contracts
  def define_data(inputs = {}.freeze)
    @user_defined ||= {}
    inputs.each { |name, contract| @user_defined[name] = contract if contract.respond_to? :call }
  end

  # Set up contract enforcement for a given method
  def contract(method, *inputs)
    @contracts ||= {}
    @contracts[method] = inputs
    method_added(method)
  end

  # Internal setup for contract enforcement on a method
  def setup_contract(method, inputs)
    @contracts[method] = nil
    method_renamed = "__#{method}".intern

    # Generate conditions for contract checks
    conditions = inputs.flatten.each_with_index.map do |input, i|
      <<-CONDITION
        unless self.class.valid_contract(#{input.inspect}).call(args[#{i}])
          raise ContractViolation, "argument #{i + 1} of method '#{method}' must" +
                  "satisfy the '#{input}' contract", caller
        end
      CONDITION
    end.join("\n")

    # Redefine the method with contract checks
    class_eval <<-METHOD, __FILE__, __LINE__ + 1
      alias_method #{method_renamed.inspect}, #{method.inspect}
      def #{method}(*args)
        #{conditions}
        #{method_renamed}(*args)
      end
    METHOD
  end

  # Hook called when a new method is added
  def method_added(method)
    if (inputs = @contracts[method])
      setup_contract(method, inputs)
    end
  end
end


class TestContracts
  extend Contracts

  # Define contracts for writable and positive conditions
  writable_and_open = lambda do |x|
    x.respond_to?('write') && x.respond_to?('closed?') && !x.closed?
  end

  define_data(
    writable: writable_and_open,
    positive: lambda { |x| x.is_a?(Numeric) && x >= 0 }
  )

  # Apply contracts to the hello method
  contract :hello, [:positive, :string, :writable]

  # The hello method definition
  def hello(n, s, f)
    n.times { f.write "hello #{s}!\n" }
  end
end

# Example usage
tc = TestContracts.new
tc.hello(2, 'world', $stdout)
# Output:
# hello world!
# hello world!

# These calls will raise Contracts::ContractViolation due to contract violations
begin
  tc.hello(-1, 'world', $stdout)
rescue Contracts::ContractViolation => e
  puts e.message
end

begin
  tc.hello(2, 3001, $stdout)
rescue Contracts::ContractViolation => e
  puts e.message
end

begin
  closed_file = File.open('file.txt', 'w') { }
  tc.hello(2, 'world', closed_file)
rescue Contracts::ContractViolation => e
  puts e.message
end


class TestContracts
  extend Contracts

  # Define your contracts here (as shown in your previous messages)
  contract :hello, [:positive, :string, :writable]
  # The hello method with contract checks
  def hello(n, s, f)
    unless n >= 0
      raise ContractViolation,
            "argument 1 of method 'hello' must satisfy the 'positive' contract", caller
    end

    # The check should be for the method :to_str to ensure it behaves like a string
    unless s.respond_to? :to_str
      raise ContractViolation,
            "argument 2 of method 'hello' must satisfy the 'string' contract", caller
    end

    unless f.respond_to?('write') && f.respond_to?('closed?') && !f.closed?
      raise ContractViolation,
            "argument 3 of method 'hello' must satisfy the 'writable' contract", caller
    end

    __hello(n, s, f)
  end

  private

  # The original hello method implementation
  def __hello(n, s, f)
    n.times { f.write "hello #{s}!\n" }
  end
end
