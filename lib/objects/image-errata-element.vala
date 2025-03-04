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

public class AltRepo.ImageErrataElement : Object {

    /**
     * package hash UInt64 as string in the image
     */
    public string img_hash { get; set; }

    /**
     * package version in the image
     */
    public string img_version { get; set; }

    /**
     * package release in the image
     */
    public string img_release { get; set; }

    /**
     * binary package name
     */
    public string pkg_name { get; set; }

    /**
     * package architecture in the repository
     */
    public string pkg_arch { get; set; }

    /**
     * package hash UInt64 as string in the repository
     */
    public string pkg_hash { get; set; }

    /**
     * package version in the repository
     */
    public string pkg_version { get; set; }

    /**
     * package release in the repository
     */
    public string pkg_release { get; set; }

    /**
     * package summary
     */
    public string summary { get; set; }

    /**
     * errata ID
     */
    public string errata_id { get; set; }

    /**
     * errata type
     */
    public string eh_type { get; set; }

    /**
     * task ID
     */
    public int64 task_id { get; set; }

    /**
     * changed
     */
    public string changed { get; set; }

    /**
     * package set name
     */
    public string branch { get; set; }

    /**
     * is errata discarded
     */
    public bool is_discarded { get; set; }

    /**
     * fixed vulnerabilities list
     */
    public Gee.ArrayList<VulnerabilitiesElement> vulnerabilities { get; set; default = new Gee.ArrayList<VulnerabilitiesElement> (); }
}
