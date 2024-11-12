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

public class AltRepo.SubTaskInfoElement : Object {

    /**
     * subtasks id
     */
    public int64 subtask_id { get; set; }

    /**
     * subtask type
     */
    public string subtask_type { get; set; }

    /**
     * subtask srpm
     */
    public string subtask_srpm { get; set; }

    /**
     * source package name
     */
    public string subtask_srpm_name { get; set; }

    /**
     * source package version and release
     */
    public string subtask_srpm_evr { get; set; }

    /**
     * subtask dir
     */
    public string subtask_dir { get; set; }

    /**
     * subtask tag id
     */
    public string subtask_tag_id { get; set; }

    /**
     * subtask tag name
     */
    public string subtask_tag_name { get; set; }

    /**
     * subtask tag author
     */
    public string subtask_tag_author { get; set; }

    /**
     * subtask package
     */
    public string subtask_package { get; set; }

    /**
     * subtask package from
     */
    public string subtask_pkg_from { get; set; }

    /**
     * subtask changed
     */
    public string subtask_changed { get; set; }

    /**
     * subtask type
     */
    public string type_ { get; set; }

    /**
     * source package name
     */
    public string src_pkg_name { get; set; }

    /**
     * source package hash
     */
    public string src_pkg_hash { get; set; }

    /**
     * list of subtask architectures
     */
    public SubTaskArchitectures archs { get; set; }

    /**
     * list of approvals for task
     */
    public Gee.ArrayList<TaskApprovalElement> approval { get; set; default = new Gee.ArrayList<TaskApprovalElement> (); }
}
