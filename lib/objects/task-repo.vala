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

public class AltRepo.TaskRepo : Object {

    /**
     * task id
     */
    public int64 task_id { get; set; }

    /**
     * last uploaded package set used as base
     */
    public TaskRepoInfo base_repository { get; set; }

    /**
     * list of tasks applied to base package set
     */
    public Gee.ArrayList<int64?> task_diff_list { get; set; default = new Gee.ArrayList<int64?> (); }

    /**
     * list of packages by architectures
     */
    public Gee.ArrayList<TaskRepoArchs> archs { get; set; default = new Gee.ArrayList<TaskRepoArchs> (); }
}
