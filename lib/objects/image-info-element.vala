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

public class AltRepo.ImageInfoElement : Object {

    /**
     * Image package set date
     */
    public string date { get; set; }

    /**
     * Image package set UUID
     */
    public string uuid { get; set; }

    /**
     * Image package set tag
     */
    public string tag { get; set; }

    /**
     * Image base branch
     */
    public string branch { get; set; }

    /**
     * Image edition
     */
    public string edition { get; set; }

    /**
     * Image flavor
     */
    public string flavor { get; set; }

    /**
     * Image platform
     */
    public string platform { get; set; }

    /**
     * Image release type
     */
    public string release { get; set; }

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
    public string arch { get; set; }

    /**
     * Image variant
     */
    public string variant { get; set; }

    /**
     * Image type
     */
    public string type_ { get; set; }

    /**
     * Image file name
     */
    public string file { get; set; }

    public Gee.ArrayList<string> url { get; set; default = new Gee.ArrayList<string> (); }

    /**
     * Image MD5 checksum
     */
    public string md5sum { get; set; }

    /**
     * Image GOST12 checksum
     */
    public string gost12sum { get; set; }

    /**
     * Image SHA256 checksum
     */
    public string sha256sum { get; set; }

    /**
     * list of image components information
     */
    public Gee.ArrayList<ImageInfoComponent> components { get; set; default = new Gee.ArrayList<ImageInfoComponent> (); }
}
