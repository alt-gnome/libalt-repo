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

public class AltRepo.DependenciesPackagesElement : Object {

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

    /**
     * package type
     */
    public int64 sourcepackage { get; set; }

    /**
     * package summary
     */
    public string summary { get; set; }

    /**
     * package buildtime
     */
    public int64 buildtime { get; set; }

    /**
     * package category
     */
    public string category { get; set; }

    /**
     * package maintainer
     */
    public string maintainer { get; set; }

    /**
     * list of dependency types
     */
    public Gee.ArrayList<string> dp_types {
        get; set;
        default = new Gee.ArrayList<string> ()
    }
}
