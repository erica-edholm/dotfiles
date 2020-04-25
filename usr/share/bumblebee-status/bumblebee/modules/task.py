"""Displays the next due task in TaskWarrior.

Requires the following library:
    * taskw

Parameters:
    * taskwarrior.taskrc : path to the taskrc file (defaults to ~/.taskrc)
"""

import bumblebee.input
import bumblebee.output
import bumblebee.engine

try:
    from taskw import TaskWarrior
except:
    pass


class Module(bumblebee.engine.Module):
    """TaskWarrior module."""

    def __init__(self, engine, config):
        """Initialize taskwarrior module."""
        super(Module, self).__init__(engine, config,
                                     bumblebee.output.Widget(
                                         full_text=self.output))
        self._next_task_description = ""

    def update(self, widgets):
        """Return a string with the number of pending tasks from TaskWarrior."""
        try:
            urgency=-1
            taskrc = self.parameter("taskrc", "~/.taskrc")
            w = TaskWarrior(config_filename=taskrc)
            pending_tasks = w.filter_tasks({'status': 'pending'})
            if(len(pending_tasks) == 0):
                self._next_task_description=""
            for task in pending_tasks: 
                if(task['urgency'] > urgency):
                    self._next_task_description=task['description']
                    urgency=task['urgency']
        except:
            self._next_task = 'Error, could not load tasks'

    def output(self, _):
        """Format the task counter to output in bumblebee."""
        return "{}".format(self._next_task_description)
