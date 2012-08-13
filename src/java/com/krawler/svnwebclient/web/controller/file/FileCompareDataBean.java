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
package com.krawler.svnwebclient.web.controller.file;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.krawler.svnwebclient.SVNWebClientException;
import com.krawler.svnwebclient.data.IDataProvider;
import com.krawler.svnwebclient.util.HighLighter;
import com.krawler.svnwebclient.web.controller.AbstractBean;
import com.krawler.svnwebclient.web.model.Navigation;
import com.krawler.svnwebclient.web.model.data.file.FileCompareResult;
import com.krawler.svnwebclient.web.support.AbstractRequestHandler;
import com.krawler.svnwebclient.web.support.DifferenceLine;
import com.krawler.svnwebclient.web.support.RequestHandler;

public class FileCompareDataBean extends AbstractBean {
	protected boolean binary = false;
	protected FileCompareResult fileCompareResult;

	public FileCompareDataBean() {
	}

	protected boolean executeSVNOperation(IDataProvider dataProvider)
			throws SVNWebClientException {
		List data = null;
		if (this.requestHandler.getStartRevision() != -1) {
			data = (List) this.state.getRequest().getSession().getAttribute(
					FileCompareBean.START_REVISION_CONTENT);
			this.state.getRequest().getSession().removeAttribute(
					FileCompareBean.START_REVISION_CONTENT);
			if (this.state.getRequest().getSession().getAttribute(
					FileCompareBean.START_REVISION_BINARY) != null) {
				this.binary = true;
				this.state.getRequest().getSession().removeAttribute(
						FileCompareBean.START_REVISION_BINARY);
			}
		}
		if (this.requestHandler.getEndRevision() != -1) {
			data = (List) this.state.getRequest().getSession().getAttribute(
					FileCompareBean.END_REVISION_CONTENT);
			this.state.getRequest().getSession().removeAttribute(
					FileCompareBean.END_REVISION_CONTENT);
			if (this.state.getRequest().getSession().getAttribute(
					FileCompareBean.END_REVISION_BINARY) != null) {
				this.binary = true;
				this.state.getRequest().getSession().removeAttribute(
						FileCompareBean.END_REVISION_BINARY);
			}
		}

		if (data != null) {
			Iterator it = data.iterator();
			StringBuffer mergedContent = new StringBuffer();
			String colorizedContent = null;

			while (it.hasNext()) {
				DifferenceLine element = (DifferenceLine) it.next();
				mergedContent.append(element.getLine()).append("\n");
			}
			try {
				colorizedContent = HighLighter.getHighLighter()
						.getColorizedContent(mergedContent.toString(),
								"foo." + this.getExtension());
				String lines[] = colorizedContent.split("\\r\\n|\\r|\\n");
				for (int i = 0; i < lines.length; i++) {
					((DifferenceLine) data.get(i)).setLine(lines[i]);
				}

			} catch (IOException ie) {
				throw new SVNWebClientException(ie);
			}
			this.fileCompareResult = new FileCompareResult(data);
		}
		return true;
	}

	public boolean isBinary() {
		return this.binary;
	}

	public FileCompareResult getResult() {
		return this.fileCompareResult;
	}

	protected AbstractRequestHandler getRequestHandler(
			HttpServletRequest request) {
		return new RequestHandler(request);
	}

	public Navigation getNavigation() {
		return null;
	}

	public List getActions() {
		List ret = new ArrayList();
		return ret;
	}

	protected String getExtension() {
		return this.state.getRequest().getParameter(
				FileCompareBean.PARAM_EXTENSION);
	}
}
