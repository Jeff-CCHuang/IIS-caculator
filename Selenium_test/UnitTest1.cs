using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;

using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.IE;
//add this name space to access WebDriverWait
using OpenQA.Selenium.Support.UI;

namespace Selenium_test
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethod1()
        {
            // Step a - Initiating webdriver
            IWebDriver driver = new ChromeDriver(@"C:\Program Files (x86)\selenium-dotnet-2.48.0\WebDriver");
            // Step b - open website
            driver.Navigate().GoToUrl("http://localhost/mywebservice/webapp.aspx");

            //Step c 
            IWebElement searchBtn = driver.FindElement(By.Name("runSrvice"));
            searchBtn.Click();
            System.Threading.Thread.Sleep(2000);
            IWebElement num1 = driver.FindElement(By.Name("txtNum1"));
            IWebElement num2 = driver.FindElement(By.Name("txtNum2"));
            num1.SendKeys("10");
            num2.SendKeys("20");
            IWebElement searchBtn2 = driver.FindElement(By.Name("runSrvice"));
            searchBtn2.Click();
            System.Threading.Thread.Sleep(10000);
            //Step d close website
            driver.Quit();
        }
        public void TestMethod2()
        {
            //TODO:
            return;
        }
        public void TestMethod3()
        {
            //FIXME:
            return
        }
    }
}
