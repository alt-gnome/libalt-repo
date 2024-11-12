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

public class AltRepo.DependenciesPackageBuildDependencies : Object {

    /**
     * request arguments
     */
    public Object request_args { get; set; }

    /**
     * number of packages found
     */
    public int64 length { get; set; }

    /**
     * source package info
     */
    public PackageInfo package_info { get; set; }

    /**
     * package dependencies list
     */
    public Gee.ArrayList<DependenciesPackageDependenciesElement> dependencies { get; set; default = new Gee.ArrayList<DependenciesPackageDependenciesElement> (); }

    /**
     * list of source packages of binary packages that provides required dependencies
     */
    public Gee.ArrayList<DependenciesPackageInfoElement> provided_by_src { get; set; default = new Gee.ArrayList<DependenciesPackageInfoElement> (); }
}
