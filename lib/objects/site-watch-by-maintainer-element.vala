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

public class AltRepo.SiteWatchByMaintainerElement : Object {

    /**
     * package name
     */
    public string pkg_name { get; set; }

    /**
     * old package version
     */
    public string old_version { get; set; }

    /**
     * new package version
     */
    public string new_version { get; set; }

    /**
     * package name from repology
     */
    public string repology_name { get; set; }

    /**
     * url for download src
     */
    public string url { get; set; }

    /**
     * Watch update date
     */
    public string date_update { get; set; }
}
