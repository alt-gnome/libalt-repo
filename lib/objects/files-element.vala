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

public class AltRepo.FilesElement : Object {

    /**
     * file name
     */
    public string file_name { get; set; }

    /**
     * hash from the filename
     */
    public string file_hashname { get; set; }

    /**
     * file class
     */
    public string file_class { get; set; }

    /**
     * link path
     */
    public string symlink { get; set; }

    /**
     * file permissions string representation
     */
    public string file_mode { get; set; }
}
