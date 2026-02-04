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

public class AltRepo.SiteImagePackageVersionsElement : Object {

    /**
     * image tag
     */
    public string tag { get; set; }

    /**
     * image root UUID
     */
    public string uuid { get; set; }

    /**
     * Image version major
     */
    public int64 version_major { get; set; }

    /**
     * Image version minor
     */
    public int64 version_minor { get; set; }

    /**
     * Image version sub
     */
    public int64 version_sub { get; set; }

    /**
     * Image architecture
     */
    public string img_arch { get; set; }

    /**
     * Image platform
     */
    public string platform { get; set; }

    /**
     * Image variant
     */
    public string variant { get; set; }

    /**
     * Image flavor
     */
    public string flavor { get; set; }

    /**
     * Image type
     */
    public string type_ { get; set; }

    /**
     * package hash UInt64 as string
     */
    public string hash { get; set; }

    /**
     * package name
     */
    public string name { get; set; }

    /**
     * package version
     */
    public string version { get; set; }

    /**
     * package release
     */
    public string release { get; set; }

    /**
     * package arch
     */
    public string arch { get; set; }
}
