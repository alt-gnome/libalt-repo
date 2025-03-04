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

public class AltRepo.UnpackagedDirsElement : Object {

    /**
     * package name
     */
    public string package { get; set; }

    /**
     * unpackaged directory
     */
    public string directory { get; set; }

    /**
     * package version
     */
    public string version { get; set; }

    /**
     * package release
     */
    public string release { get; set; }

    /**
     * package epoch
     */
    public int64 epoch { get; set; }

    /**
     * maintainer name
     */
    public string packager { get; set; }

    /**
     * maintainer email
     */
    public string email { get; set; }

    /**
     * binary packages archs
     */
    public Gee.ArrayList<string> archs { get; set; default = new Gee.ArrayList<string> (); }
}
