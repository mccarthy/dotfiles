# modified from this
# https://gist.github.com/tpitale/11e5a2a152ec67a172f9
# my key binding is this: { "keys": ["f12"], "command": "timestamp" }
# previously I used this, very similar technique: 
# https://stackoverflow.com/questions/11879481/can-i-add-date-time-for-sublime-snippet

import datetime
import sublime, sublime_plugin
 
class TimestampCommand(sublime_plugin.TextCommand):
  def run(self, edit):
    timestamp = "%s" % (datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
    output = "=====" + timestamp + "====="
    self.view.insert(edit, self.view.sel()[0].begin(), output)
