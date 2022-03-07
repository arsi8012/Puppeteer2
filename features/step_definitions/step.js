const puppeteer = require("puppeteer");
const chai = require("chai");
const expect = chai.expect;

const { Given, When, Then, Before, After } = require("cucumber");
const { clickElement, putText, getText } = require("../../lib/commands.js");

Before(async function () {
    const browser = await puppeteer.launch({ headless: false, slowMo: 50 });
    const page = await browser.newPage();
    this.browser = browser;
    this.page = page;
  });

After(async function () {
    if (this.browser) {
        await this.browser.close();
    }
});

Given("user is on {string} page", async function (string) {
    return await this.page.goto(`${string}`);
  });

When("user choose day of the week {string}", async function (string) {
    await clickElement(this.page, `${string}`);
});

When("user choose session time {string}", async function (string) {
    await clickElement(this.page, `${string}`);
});

When("user choose place {string}", async function (string) {
    await clickElement(this.page, `${string}`);
});

When("user clicks the book button {string}", async function (string) {
    await clickElement(this.page, `${string}`);
});

When("user click button get booking code {string}", async function (string) {
    await clickElement(this.page, `${string}`);
});

When("user sees the qr code and text first {string}", async function (string) {
    const actual = await getText(this.page, "h2.ticket__check-title");
    const expected = await string;
    expect(actual).contains(expected);
});

When("user reopens page {string}", async function (string) {
    return await this.page.goto(`${string}`, {setTimeout: 50000,});
});

Then("user sees the qr code and text {string}", async function (string) {
    const actual = await getText(this.page, "p.ticket__hint");
    const expected = await string;
    expect(actual).contains(expected);
});

Then("button for booking is inactive {string}", async function (string) {
    const actual = String(await this.page.$eval("button", (button) => { return button.disabled; }));
    const expected = await string;
    expect(actual).contains(expected);
});