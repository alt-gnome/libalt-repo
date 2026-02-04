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

public class AltRepo.CheckImagesOutputImage : Object {

    /**
     * image file
     */
    public string file { get; set; }

    /**
     * image branch
     */
    public string branch { get; set; }

    /**
     * image edition
     */
    public string edition { get; set; }

    /**
     * image flavor
     */
    public string flavor { get; set; }

    /**
     * image platform
     */
    public string platform { get; set; }

    /**
     * image release
     */
    public string release { get; set; }

    /**
     * image major version
     */
    public int64 major_version { get; set; }

    /**
     * image minor version
     */
    public int64 minor_version { get; set; }

    /**
     * image sub version
     */
    public int64 sub_version { get; set; }

    /**
     * image arch
     */
    public string arch { get; set; }

    /**
     * image variant
     */
    public string variant { get; set; }

    /**
     * image type
     */
    public string type_ { get; set; }

    /**
     * image built date in ISO8601 format
     */
    public string buildtime { get; set; }

    /**
     * list of binary packages
     */
    public Gee.ArrayList<CheckImagesOutputPackage> packages {
        get; set;
        default = new Gee.ArrayList<CheckImagesOutputPackage> ();
    }
}
