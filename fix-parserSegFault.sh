# $ smusher
# /Users/username/.rvm/gems/ruby-1.9.3-p327/gems/json-1.7.5/lib/json/ext/parser.bundle: [BUG] Segmentation fault
# ruby 1.8.7 (2012-02-08 patchlevel 358) [universal-darwin12.0]
# 
# Abort trap: 6
 
# This fix will remove all Ruby gems and reinstall bundler
read -p "Will now uninstall all Ruby gems..."
 
gem list | cut -d" " -f1 | xargs gem uninstall -aIx
 
gem install bundler
 
exit
