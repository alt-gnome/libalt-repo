/*
 * Copyright (C) 2026 Vladimir Vaskov
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

public class AltRepo.TaskInfoSubtask : Object {

    /**
     * subtask id
     */
    public int64 subtask_id { get; set; }

    /**
     * subtask state last changed
     */
    public string last_changed { get; set; }

    /**
     * subtask creator
     */
    public string userid { get; set; }

    /**
     * subtask type
     */
    public string type_ { get; set; }

    /**
     * subtask sid
     */
    public string sid { get; set; }

    /**
     * subtask dir
     */
    public string dir { get; set; }

    /**
     * subtask package
     */
    public string package { get; set; }

    /**
     * gear tag author
     */
    public string tag_author { get; set; }

    /**
     * gear tag name
     */
    public string tag_name { get; set; }

    /**
     * gear tag id
     */
    public string tag_id { get; set; }

    /**
     * source package
     */
    public string srpm { get; set; }

    /**
     * source package name
     */
    public string srpm_name { get; set; }

    /**
     * source package EVR
     */
    public string srpm_evr { get; set; }

    /**
     * package copy from
     */
    public string pkg_from { get; set; }

    public TaskInfoPackage source_package { get; set; }

    /**
     * subtask approvals
     */
    public Gee.ArrayList<TaskInfoApprovals> approvals {
        get; set;
        default = new Gee.ArrayList<TaskInfoApprovals> ();
    }

    /**
     * subtask archs
     */
    public Gee.ArrayList<TaskInfoArchs> archs {
        get; set;
        default = new Gee.ArrayList<TaskInfoArchs> ();
    }
}
