"""Displays the next due task in TaskWarrior.

Requires the following library:
    * taskw

Parameters:
    * taskwarrior.taskrc : path to the taskrc file (defaults to ~/.taskrc)
"""

import core.decorators
import core.module
import core.widget
from taskw import TaskWarrior

class Module(core.module.Module):
    def __init__(self, config, theme):
        super().__init__(config, theme, core.widget.Widget(self.output))

        self.__next_task_description = "0"

    def update(self):
        """Return a string with the number of pending tasks from TaskWarrior."""
        try:
            urgency = -1
            taskrc = self.parameter("taskrc", "~/.taskrc")
            w = TaskWarrior(config_filename=taskrc)
            all_tasks = w.filter_tasks({})
            pending_tasks = []
            for i in range(len(all_tasks)):
                if all_tasks[i]['status'] == 'pending':
                    pending_tasks.append(all_tasks[i])
            if len(pending_tasks) == 0:
                self.__next_task_description = ""
            for task in pending_tasks:
                if task['urgency'] > urgency:
                    self.__next_task_description = task['description']
                    urgency = task['urgency']
        except:
            self.__next_task_description = "Error, could not load tasks"

    def output(self, _):
        """Format the task counter to output in bumblebee."""
        return "{}".format(self.__next_task_description)
