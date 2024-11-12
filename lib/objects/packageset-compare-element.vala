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

public class AltRepo.PackagesetCompareElement : Object {

    /**
     * packageset #1 name
     */
    public string pkgset1 { get; set; }

    /**
     * packageset #2 name
     */
    public string pkgset2 { get; set; }

    /**
     * package from packageset #1
     */
    public PackagesetComparePackage package1 { get; set; }

    /**
     * package from packageset #2
     */
    public PackagesetComparePackage package2 { get; set; }
}
