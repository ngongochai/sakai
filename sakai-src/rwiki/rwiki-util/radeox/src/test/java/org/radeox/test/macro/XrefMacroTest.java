/*
 * This file is part of "SnipSnap Radeox Rendering Engine".
 *
 * Copyright (c) 2002 Stephan J. Schmidt, Matthias L. Jugel
 * All Rights Reserved.
 *
 * Please visit http://radeox.org/ for updates and contact.
 *
 * --LICENSE NOTICE--
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * --LICENSE NOTICE--
 */
package org.radeox.test.macro;

import junit.framework.Test;
import junit.framework.TestSuite;

import org.radeox.EngineManager;

public class XrefMacroTest extends MacroTestSupport
{
	public XrefMacroTest(String name)
	{
		super(name);
	}

	public static Test suite()
	{
		return new TestSuite(XrefMacroTest.class);
	}

	public void testLineNumber()
	{
		String result = EngineManager.getInstance().render(
				"{xref:com.tirsen.nanning.MixinInstance@Nanning|83}", context);
		assertEquals(
				"<a href=\"http://nanning.sourceforge.net/xref/com/tirsen/nanning/MixinInstance.html#83\">com.tirsen.nanning.MixinInstance</a>",
				result);
	}

	public void testNoLineNumber()
	{
		String result = EngineManager.getInstance().render(
				"{xref:com.tirsen.nanning.MixinInstance@Nanning}", context);
		assertEquals(
				"<a href=\"http://nanning.sourceforge.net/xref/com/tirsen/nanning/MixinInstance.html\">com.tirsen.nanning.MixinInstance</a>",
				result);
	}

}
