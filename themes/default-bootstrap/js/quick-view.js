/*
* 2007-2013 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2013 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*/
function quick_view() {
	$('.quick-view').click(function() {
		var url = this.rel.split('.html');
		if(url.length == 1)
		{
			n = this.rel.indexOf('?');
			if(n == -1)
			{
				url = this.rel+'?content_only=1';
			}
			else
			{
				url = this.rel+'&content_only=1';
			}
		}
		else
		{
			url = url[0]+'.html?content_only=1'+url[1];
		}
		$.fancybox({
			'padding':0,
			'width':1087,
			'height':610,
			'type':'iframe',
			'href':url
		});
		ajaxCart.refresh();
		return false;
	});
}
$(document).ready(function() {
	quick_view();
});
