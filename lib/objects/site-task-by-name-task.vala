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

public class AltRepo.SiteTaskByNameTask : Object {

    /**
     * task id
     */
    public int64 id { get; set; }

    /**
     * task state
     */
    public string state { get; set; }

    /**
     * task branch
     */
    public string branch { get; set; }

    /**
     * task owner nickname
     */
    public string owner { get; set; }

    /**
     * task last changed (ISO 8601 format)
     */
    public string changed { get; set; }

    /**
     * task packages
     */
    public Gee.ArrayList<SiteTaskByNamePackage> packages {
        get; set;
        default = new Gee.ArrayList<SiteTaskByNamePackage> ();
    }
}
