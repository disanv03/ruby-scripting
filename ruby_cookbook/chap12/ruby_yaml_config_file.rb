# recipe-13.12
# Reading and Writing configuration Files

# YAML serialization format
require 'yaml'

configuration = { 'color' => 'blue',
                  'font' => 'septimus',
                  'font-size' => 7 }
open('text.cfg', 'w') { |f| YAML.dump(configuration, f) }
open('text.cfg') { |f| puts f.read }

open('text.cfg') { |f| YAML.load(f) }
