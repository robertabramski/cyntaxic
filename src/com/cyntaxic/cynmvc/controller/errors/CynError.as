package com.cyntaxic.cynmvc.controller.errors
{
	public class CynError extends Error
	{
		public function CynError(message:* = "", id:* = 0)
		{
			super(message, id);
		}
	}
}