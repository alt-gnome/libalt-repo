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

public class AltRepo.SitePackageBeehiveElement : Object {

    /**
     * Beehive rebuild arch
     */
    public string arch { get; set; }

    /**
     * Beehive rebuild status
     */
    public string status { get; set; }

    /**
     * Beehive rebuild date
     */
    public string updated { get; set; }

    /**
     * Beehive package build elapsed (seconds)
     */
    public double build_time { get; set; }

    /**
     * Package FTBFS since date
     */
    public string ftbfs_since { get; set; }

    /**
     * Beehive package build error log URL
     */
    public string url { get; set; }
}
