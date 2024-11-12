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

public class AltRepo.TaskPackages : Object {

    /**
     * task id
     */
    public int64 id { get; set; }

    /**
     * task repo
     */
    public string repo { get; set; }

    /**
     * task owner
     */
    public string owner { get; set; }

    /**
     * task state
     */
    public string state { get; set; }

    /**
     * task is test-only
     */
    public int64 testonly { get; set; }

    /**
     * task last try
     */
    public int64 try { get; set; }

    /**
     * task last iteration
     */
    public int64 iter { get; set; }

    /**
     * task message
     */
    public string message { get; set; }

    public Gee.ArrayList<int64?> dependencies { get; set; default = new Gee.ArrayList<int64?> (); }

    /**
     * number of subtasks found
     */
    public int64 length { get; set; }

    /**
     * subtask packages
     */
    public Gee.ArrayList<TaskPackagesSubtaskElement> subtasks { get; set; default = new Gee.ArrayList<TaskPackagesSubtaskElement> (); }

    /**
     * arepo packages
     */
    public Gee.ArrayList<TaskPackagesPackageElement> arepo { get; set; default = new Gee.ArrayList<TaskPackagesPackageElement> (); }
}
