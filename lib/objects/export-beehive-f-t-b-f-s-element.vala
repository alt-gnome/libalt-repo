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

public class AltRepo.ExportBeehiveFTBFSElement : Object {

    /**
     * Beehive branch
     */
    public string branch { get; set; }

    /**
     * package hash
     */
    public string hash { get; set; }

    /**
     * package name
     */
    public string name { get; set; }

    /**
     * package epoch
     */
    public int64 epoch { get; set; }

    /**
     * package version
     */
    public string version { get; set; }

    /**
     * package release
     */
    public string release { get; set; }

    /**
     * Beehive arch
     */
    public string arch { get; set; }

    /**
     * Beehive rebuild date
     */
    public string updated { get; set; }

    /**
     * Package FTBFS since date
     */
    public string ftbfs_since { get; set; }

    /**
     * Beehive package build error log URL
     */
    public string url { get; set; }
}
