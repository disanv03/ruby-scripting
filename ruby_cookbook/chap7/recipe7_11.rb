# Coupling Systems Loosely with Callbacks
# Problem:
# You want to combine different types of objects without hardcoding them full
# of references to each other.

module EventDispatcher
  def setup_listeners
    @event_dispatcher_listeners = {}
  end

  def subscribe(event, &callback)
    (@event_dispatcher_listeners[event] ||= []) << callback
  end

  protected

  def notify(event, *args)
    return unless @event_dispatcher_listeners
    @event_dispatcher_listeners[event]&.each do |m|
      m.call(*args) if m.respond_to?(:call)
    end
  end
end

class Factory
  include EventDispatcher

  def initialize
    setup_listeners
  end

  def produce_widget(color)
    # Widget creation code goes here...
    notify(:new_widget, color)
  end
end

class WidgetCounter
  def initialize(factory)
    @counts = Hash.new(0)
    factory.subscribe(:new_widget) do |color|
      @counts[color] += 1
      puts "#{@counts[color]} #{color} widget(s) created since started watching."
    end
  end
end

f1 = Factory.new
WidgetCounter.new(f1)
f1.produce_widget("red")

f1.produce_widget("green")
f1.produce_widget("red")

# This won't produce any output, since our listener is listening to another factory
Factory.new.produce_widget("blue")

# Callbacks are an essential technique for making your code extensible.
# this technique has many names (callback, hook methods, plugins, publish/subscribe, etc).
# One object asks another to call to call a piece of code (the callback) when some condition is met.
# This technique works even when the two objects know almost nothing about each other.

# module EventDispatcher
#   def notify(event, *args)
#     if @event_dispatcher_listeners[event]
#       @event_dispatcher_listeners[event].each do |m|
#         yield(m.call(*args)) if m.respond_to? :call
#       end
#     end
#     nil
#   end
# end
#
# class Portal
#   include EventDispatcher
#
#   def initialize
#     setup_listeners
#   end
#
#   def render
#     puts '<table>'
#     render_block = Proc.new { |box| puts " <td>#{box}</td>" }
#     [:row1, :row2].each do |row|
#       puts ' <tr>'
#       notify(row, &render_block)
#       puts ' </tr>'
#     end
#     puts '</table>'
#   end
# end
#
# portal = Portal.new
# portal.subscribe(:row1) { 'Stock Ticker' }
# portal.subscribe(:row1) { 'Weather' }
# portal.subscribe(:row2) { 'Pointless, Trivial News' }
# portal.render
