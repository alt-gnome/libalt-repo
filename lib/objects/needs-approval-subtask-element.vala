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

public class AltRepo.NeedsApprovalSubtaskElement : Object {

    /**
     * subtask id
     */
    public int64 id { get; set; }

    /**
     * subtask type
     */
    public string type_ { get; set; }

    /**
     * subtask package
     */
    public string package { get; set; }

    /**
     * subtask userid
     */
    public string userid { get; set; }

    /**
     * subtask dir
     */
    public string dir { get; set; }

    /**
     * subtask sid
     */
    public string sid { get; set; }

    /**
     * subtask package from
     */
    public string pkg_from { get; set; }

    /**
     * subtask tag author
     */
    public string tag_author { get; set; }

    /**
     * subtask tag id
     */
    public string tag_id { get; set; }

    /**
     * subtask tag name
     */
    public string tag_name { get; set; }

    /**
     * subtask srpm
     */
    public string srpm { get; set; }

    /**
     * subtask srpm name
     */
    public string srpm_name { get; set; }

    /**
     * subtask evr
     */
    public string srpm_evr { get; set; }

    /**
     * subtask last changed
     */
    public string last_changed { get; set; }

    public TaskInfoPackage source_package { get; set; }
}
