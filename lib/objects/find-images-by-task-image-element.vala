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

public class AltRepo.FindImagesByTaskImageElement : Object {

    /**
     * image filename
     */
    public string filename { get; set; }

    /**
     * image edition
     */
    public string edition { get; set; }

    /**
     * image tag
     */
    public string tag { get; set; }

    /**
     * image built date in ISO8601 format
     */
    public string buildtime { get; set; }

    /**
     * image's binary package name
     */
    public string binpkg_name { get; set; }

    /**
     * image's binary package version
     */
    public string binpkg_version { get; set; }

    /**
     * image's binary package release
     */
    public string binpkg_release { get; set; }

    /**
     * image's binary package architecture
     */
    public string binpkg_arch { get; set; }

    /**
     * image's binary package hash
     */
    public string binpkg_hash { get; set; }
}
