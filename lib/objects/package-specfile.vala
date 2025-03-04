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

public class AltRepo.PackageSpecfile : Object {

    /**
     * request arguments
     */
    public Object request_args { get; set; }

    /**
     * package hash UInt64 as string
     */
    public string pkg_hash { get; set; }

    /**
     * source package name
     */
    public string pkg_name { get; set; }

    /**
     * source package version
     */
    public string pkg_version { get; set; }

    /**
     * source package release
     */
    public string pkg_release { get; set; }

    /**
     * spec file name
     */
    public string specfile_name { get; set; }

    /**
     * spec file mtime
     */
    public string specfile_date { get; set; }

    /**
     * spec file base64 encoded raw contents
     */
    public string specfile_content { get; set; }
}
