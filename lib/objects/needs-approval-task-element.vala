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

public class AltRepo.NeedsApprovalTaskElement : Object {

    /**
     * task id
     */
    public int64 id { get; set; }

    /**
     * task state
     */
    public string state { get; set; }

    /**
     * task runby
     */
    public string runby { get; set; }

    /**
     * task last try
     */
    public int64 try { get; set; }

    /**
     * task last iteration
     */
    public int64 iter { get; set; }

    /**
     * task failearly
     */
    public bool failearly { get; set; }

    /**
     * task shared
     */
    public bool shared { get; set; }

    public Gee.ArrayList<int64?> depends {
        get; set;
        default = new Gee.ArrayList<int64?> ();
    }

    /**
     * task testonly
     */
    public bool testonly { get; set; }

    /**
     * task message
     */
    public string message { get; set; }

    /**
     * task version
     */
    public string version { get; set; }

    /**
     * previous task
     */
    public int64 prev { get; set; }

    /**
     * task last changed
     */
    public string last_changed { get; set; }

    /**
     * task branch
     */
    public string branch { get; set; }

    /**
     * task user
     */
    public string user { get; set; }

    /**
     * list of subtasks
     */
    public Gee.ArrayList<NeedsApprovalSubtaskElement> subtasks {
        get; set;
        default = new Gee.ArrayList<NeedsApprovalSubtaskElement> ();
    }
}
