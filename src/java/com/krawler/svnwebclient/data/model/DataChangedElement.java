/*
 * Copyright (C) 2012  Krawler Information Systems Pvt Ltd
 * All rights reserved.
 * 
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
*/
package com.krawler.svnwebclient.data.model;

import java.util.Date;

import com.krawler.svnwebclient.configuration.ConfigurationProvider;

public class DataChangedElement {
	protected String name;
	protected String author;
	protected Date date;
	protected long revision;
	protected String comment;
	protected boolean directory;
	protected long size;

	public long getSize() {
		return size;
	}

	public void setSize(long size) {
		this.size = size;
	}

	public void setDirectory(boolean directory) {
		this.directory = directory;
	}

	public boolean isDirectory() {
		return this.directory;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return this.name;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getAuthor() {
		return ConfigurationProvider.getInstance().getAuthorDecorator()
				.getAuthorName(this.author);
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Date getDate() {
		return this.date;
	}

	public void setRevision(long revision) {
		this.revision = revision;
	}

	public long getRevision() {
		return this.revision;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getComment() {
		return this.comment;
	}
}
