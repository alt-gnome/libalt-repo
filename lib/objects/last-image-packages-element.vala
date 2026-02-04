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

public class AltRepo.LastImagePackagesElement : Object {

    /**
     * task id
     */
    public string task_id { get; set; }

    /**
     * task changed date
     */
    public string task_changed { get; set; }

    /**
     * task type [add|delete]
     */
    public string tplan_action { get; set; }

    /**
     * package set name
     */
    public string branch { get; set; }

    /**
     * package hash UInt64 as string in the repository
     */
    public string hash { get; set; }

    /**
     * package name
     */
    public string name { get; set; }

    /**
     * package version in the repository
     */
    public string version { get; set; }

    /**
     * package release in the repository
     */
    public string release { get; set; }

    /**
     * package architecture in the repository
     */
    public string arch { get; set; }

    /**
     * package hash UInt64 as string in the image
     */
    public string img_hash { get; set; }

    /**
     * package version in the image
     */
    public string img_version { get; set; }

    /**
     * package release in the image
     */
    public string img_release { get; set; }

    /**
     * package summary
     */
    public string summary { get; set; }

    /**
     * package last changelog name
     */
    public string chlog_name { get; set; }

    /**
     * maintainer nickname in the changelog
     */
    public string chlog_nick { get; set; }

    /**
     * package last changelog message date
     */
    public string chlog_date { get; set; }

    /**
     * package last changelog message
     */
    public string chlog_text { get; set; }
}
