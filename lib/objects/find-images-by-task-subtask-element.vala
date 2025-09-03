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

public class AltRepo.FindImagesByTaskSubtaskElement : Object {

    /**
     * subtask id
     */
    public int64 id { get; set; }

    /**
     * subtask type
     */
    public string type_ { get; set; }

    /**
     * subtask srpm name
     */
    public string srpm_name { get; set; }

    /**
     * subtask srpm hash
     */
    public string srpm_hash { get; set; }

    /**
     * subtask's source package version
     */
    public string pkg_version { get; set; }

    /**
     * subtask's source package release
     */
    public string pkg_release { get; set; }

    /**
     * affected images (by binary packages)
     */
    public Gee.ArrayList<FindImagesByTaskImageElement> images {
        get; set;
        default = new Gee.ArrayList<FindImagesByTaskImageElement> ();
    }
}
