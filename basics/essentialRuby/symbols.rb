############################
# Symbols
############################
# Like strings but cannot be edited
# Begin with a colon
# Not delimited by quotes
# Lowercase, underscore, no spaces
# Act as a label (to label a piece of data)
############################

person = {
    :first_name => 'Benjamin',
    :last_name => 'Franklin'
}

person[:last_name] # Output "Franklin"

# Manage memory differently
# In irb
"test".object_id # 67463
"test".object_id # 4656797

:test.object_id # 4567557
:test.object_id # 4567557 same id number
