/*
 * Copyright (C) 2024 Vladimir Vaskov
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

// THIS CODE WAS GENERATED, DON'T MODIFY IT

public class AltRepo.TaskProgressTaskInfo : Object {

    /**
     * task id
     */
    public int64 task_id { get; set; }

    /**
     * repository name
     */
    public string task_repo { get; set; }

    /**
     * task state
     */
    public string task_state { get; set; }

    /**
     * task owner
     */
    public string task_owner { get; set; }

    /**
     * task try number
     */
    public int64 task_try { get; set; }

    /**
     * task iteration number
     */
    public int64 task_iter { get; set; }

    /**
     * task test only
     */
    public int64 task_testonly { get; set; }

    /**
     * task changed
     */
    public string task_changed { get; set; }

    /**
     * task message
     */
    public string task_message { get; set; }

    /**
     * task stage
     */
    public string task_stage { get; set; }

    /**
     * task dependencies
     */
    public Gee.ArrayList<int64?> dependencies { get; set; default = new Gee.ArrayList<int64?> (); }

    /**
     * list of subtasks by task
     */
    public Gee.ArrayList<SubTaskInfoElement> subtasks { get; set; default = new Gee.ArrayList<SubTaskInfoElement> (); }

    /**
     * task iteration list
     */
    public Gee.ArrayList<TaskIterationsElement> iterations { get; set; default = new Gee.ArrayList<TaskIterationsElement> (); }
}
