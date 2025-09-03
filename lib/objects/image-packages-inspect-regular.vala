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

public class AltRepo.ImagePackagesInspectRegular : Object {

    /**
     * request arguments
     */
    public Object request_args { get; set; }

    /**
     * number of input packages
     */
    public int64 input_pakages { get; set; }

    /**
     * number of packages not found in branch
     */
    public int64 not_in_branch { get; set; }

    /**
     * number of packages found in build tasks
     */
    public int64 found_in_tasks { get; set; }

    /**
     * number of packages not found in database
     */
    public int64 not_found_in_db { get; set; }

    /**
     * list of packages that not in branch but found in build tasks
     */
    public Gee.ArrayList<ImagePackagesElement2> packages_in_tasks {
        get; set;
        default = new Gee.ArrayList<ImagePackagesElement2> ();
    }

    /**
     * list of packages that not found in database
     */
    public Gee.ArrayList<ImagePackagesElement1> packages_not_in_db {
        get; set;
        default = new Gee.ArrayList<ImagePackagesElement1> ();
    }
}
