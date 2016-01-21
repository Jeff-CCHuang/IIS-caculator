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
        private IWebDriver InitDriver()
        {
            // Step a - Initiating webdriver
            IWebDriver driver = new ChromeDriver(@"C:\Program Files (x86)\selenium-dotnet-2.48.0\WebDriver");
            // Step b - open website
            driver.Navigate().GoToUrl("http://localhost/mywebservice/webapp.aspx");
            return driver;
        }
        private void TestCalculation(IWebDriver driver)
        {
            // Test Calculation (Add & Mul)
            int count = 10;
            // find button
            IWebElement searchBtn = driver.FindElement(By.Name("runSrvice"));
            searchBtn.Click();
            System.Threading.Thread.Sleep(2000);
            Random rnd = new Random();
            while (count > 0)
            {
                IWebElement num1 = driver.FindElement(By.Name("txtNum1"));
                IWebElement num2 = driver.FindElement(By.Name("txtNum2"));
                num1.SendKeys(rnd.Next(50).ToString());
                num2.SendKeys(rnd.Next(50).ToString());
                IWebElement searchBtn2 = driver.FindElement(By.Name("runSrvice"));
                searchBtn2.Click();
                System.Threading.Thread.Sleep(2000);
                count--;
            }
        }
        private void TestShow(IWebDriver driver)
        {
            IWebElement searchBtn = driver.FindElement(By.Name("getResult"));
            searchBtn.Click();
        }
        private void TestClean(IWebDriver driver)
        {
            IWebElement searchBtn = driver.FindElement(By.Name("cleanResult"));
            searchBtn.Click();
        }
        [TestMethod]
        public void TestMethod1()
        {

            // init driver
            IWebDriver driver = InitDriver();
            TestCalculation(driver);

            TestShow(driver);
            System.Threading.Thread.Sleep(5000);

            TestClean(driver);
            System.Threading.Thread.Sleep(5000);

            //Step d close website
            driver.Quit();
        }
        public void TestMethod2()
        {
            //TODO:
            // Test Show Table
            return;
        }
        public void TestMethod3()
        {
            //FIXME:
            #warning clean_table
     
            return;
        }
    }
}
