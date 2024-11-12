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

public class AltRepo.ImageStatusGetElement : Object {

    /**
     * ISO image base branch
     */
    public string branch { get; set; }

    /**
     * ISO image edition
     */
    public string edition { get; set; }

    /**
     * ISO image name
     */
    public string name { get; set; }

    /**
     * hide - hide image, show - show image
     */
    public string show { get; set; }

    /**
     * support start date
     */
    public string start_date { get; set; }

    /**
     * support end date
     */
    public string end_date { get; set; }

    /**
     * image summary in Russian
     */
    public string summary_ru { get; set; }

    /**
     * image summary in English
     */
    public string summary_en { get; set; }

    /**
     * html description in Russian in Base64 format
     */
    public string description_ru { get; set; }

    /**
     * html description in English in Base64 format
     */
    public string description_en { get; set; }

    /**
     * link to mailing list
     */
    public string mailing_list { get; set; }

    /**
     * image name for bugzilla
     */
    public string name_bugzilla { get; set; }

    /**
     * image mirror's auxilary info as JSON substructure
     */
    public Object json { get; set; }
}
