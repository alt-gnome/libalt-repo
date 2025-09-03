/*
 * Copyright (C) 2025 Vladimir Vaskov
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

public class AltRepo.TaskInfo : Object {

    /**
     * task id
     */
    public int64 id { get; set; }

    /**
     * previous task id
     */
    public int64 prev { get; set; }

    /**
     * task try
     */
    public int64 try { get; set; }

    /**
     * task iteration
     */
    public int64 iter { get; set; }

    /**
     * all task rebuilds
     */
    public Gee.ArrayList<string> rebuilds {
        get; set;
        default = new Gee.ArrayList<string> ()
    }

    /**
     * task state
     */
    public string state { get; set; }

    /**
     * task branch
     */
    public string branch { get; set; }

    /**
     * task owner
     */
    public string user { get; set; }

    /**
     * task ran by
     */
    public string runby { get; set; }

    /**
     * testonly flag
     */
    public int64 testonly { get; set; }

    /**
     * failearly flag
     */
    public int64 failearly { get; set; }

    /**
     * shared flag
     */
    public int64 shared { get; set; }

    /**
     * task depends on
     */
    public Gee.ArrayList<int64?> depends {
        get; set;
        default = new Gee.ArrayList<int64?> ()
    }

    /**
     * task message
     */
    public string message { get; set; }

    /**
     * task version
     */
    public string version { get; set; }

    /**
     * task state last changed
     */
    public string last_changed { get; set; }

    /**
     * task subtasks
     */
    public Gee.ArrayList<TaskInfoSubtask> subtasks {
        get; set;
        default = new Gee.ArrayList<TaskInfoSubtask> ()
    }

    /**
     * task packages add/delete
     */
    public TaskInfoPlan2 plan { get; set; }
}
