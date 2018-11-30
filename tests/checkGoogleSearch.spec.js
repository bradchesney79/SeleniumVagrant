"use strict";

require('chromedriver');
require('jasmine');
var webdriver = require('selenium-webdriver');
var browser = new webdriver.Builder().usingServer().withCapabilities({'browserName': 'chrome' }).build();

browser.get('https://www.google.com');
browser.findElement(webdriver.By.name('q')).sendKeys('automated testing');

describe('Google search results show for automated testing', function() {
    // beforeAll(function() {
    //     console.log('Testing google search');
    // });
    
    // it('Has search text', function() {
    //     console.log('Testing: ' + title');
    //     expect(browser.findElement(webdriver.By.name('q')).getAttribute("value")).toBe("automated testing");
    // });

    it('True is true', function() {
        console.log('Testing: basic test');
        expect(true).toBe(true);
    });

  //   afterAll(function() {
		// function closeBrowser() {
		// 	browser.quit();
		// }
  //   });
});

/*
* Carry out a Google Search
*/





// function logTitle() {
// 	browser.getTitle().then(function(title) {
// 		console.log();
// 	});
// }

// function clickLink(link) {
// 	link.click();
// }

// function handleFailure(err) {
// 	console.error('Something went wrong\n', err.stack, '\n');
// 	closeBrowser();
// }

// function closeBrowser() {
// 	browser.quit();
// }


