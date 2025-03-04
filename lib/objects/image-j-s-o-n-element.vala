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

public class AltRepo.ImageJSONElement : Object {

    /**
     * ISO image edition
     */
    public string img_edition { get; set; }

    /**
     * ISO image name
     */
    public string img_name { get; set; }

    /**
     * hide - hide image, show - show image
     */
    public string img_show { get; set; }

    /**
     * image summary in Russian
     */
    public string img_summary_ru { get; set; }

    /**
     * image summary in English
     */
    public string img_summary_en { get; set; }

    /**
     * support start date
     */
    public string img_start_date { get; set; }

    /**
     * support end date
     */
    public string img_end_date { get; set; }

    /**
     * link to mailing list
     */
    public string img_mailing_list { get; set; }

    /**
     * image name for bugzilla
     */
    public string img_name_bugzilla { get; set; }

    /**
     * image mirror's auxilary info as JSON substructure
     */
    public Object img_json { get; set; }
}
