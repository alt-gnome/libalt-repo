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

public class AltRepo.PackageSetStatusPostElement : Object {

    /**
     * package set name
     */
    public string pkgset_name { get; set; }

    /**
     * package set name for bugzilla
     */
    public string rs_pkgset_name_bugzilla { get; set; }

    /**
     * support start date
     */
    public string rs_start_date { get; set; }

    /**
     * support end date
     */
    public string rs_end_date { get; set; }

    /**
     * 0 - hide branch, 1 - show branch
     */
    public int64 rs_show { get; set; }

    /**
     * html description in Russian in Base64 format
     */
    public string rs_description_ru { get; set; }

    /**
     * html description in English in Base64 format
     */
    public string rs_description_en { get; set; }

    /**
     * link to mailing list
     */
    public string rs_mailing_list { get; set; }

    /**
     * packageset mirror's auxilary info as JSON substructure
     */
    public Gee.ArrayList<Object> rs_mirrors_json {
        get; set;
        default = new Gee.ArrayList<Object> ();
    }
}
