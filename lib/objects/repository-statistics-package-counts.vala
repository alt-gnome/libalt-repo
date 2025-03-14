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

public class AltRepo.RepositoryStatisticsPackageCounts : Object {

    /**
     * packages arch
     */
    public string arch { get; set; }

    /**
     * component name
     */
    public string component { get; set; }

    /**
     * packages count
     */
    public int64 count { get; set; }

    /**
     * total packages files size in bytes
     */
    public int64 size { get; set; }

    /**
     * total packages files size human readable
     */
    public string size_hr { get; set; }

    /**
     * repository component UUID
     */
    public string uuid { get; set; }
}
