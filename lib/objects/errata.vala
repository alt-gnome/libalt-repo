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

public class AltRepo.Errata : Object {

    /**
     * errata id
     */
    public string id { get; set; }

    /**
     * errata type
     */
    public string type_ { get; set; }

    /**
     * errata created date
     */
    public string created { get; set; }

    /**
     * errata updated date
     */
    public string updated { get; set; }

    /**
     * packageset name
     */
    public string pkgset_name { get; set; }

    /**
     * task id
     */
    public int64 task_id { get; set; }

    /**
     * subtask id
     */
    public int64 subtask_id { get; set; }

    /**
     * task state
     */
    public string task_state { get; set; }

    /**
     * package hash
     */
    public string pkg_hash { get; set; }

    /**
     * package name
     */
    public string pkg_name { get; set; }

    /**
     * package version
     */
    public string pkg_version { get; set; }

    /**
     * package release
     */
    public string pkg_release { get; set; }

    /**
     * list of references
     */
    public Gee.ArrayList<ErrataReference> references {
        get; set;
        default = new Gee.ArrayList<ErrataReference> ();
    }
}
