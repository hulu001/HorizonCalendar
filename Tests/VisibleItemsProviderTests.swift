// Created by Bryan Keller on 4/5/20.
// Copyright © 2020 Airbnb Inc. All rights reserved.

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import XCTest
@testable import HorizonCalendar

// MARK: - VisibleItemsProviderTests

final class VisibleItemsProviderTests: XCTestCase {

  // MARK: Internal

  // MARK: Initial anchor layout item tests

  func testVerticalInitialVisibleMonthHeader() {
    let monthHeaderItem1 = verticalVisibleItemsProvider.anchorMonthHeaderItem(
      for: Month(era: 1, year: 2020, month: 01, isInGregorianCalendar: true),
      offset: CGPoint(x: 0, y: 100),
      scrollPosition: .firstFullyVisiblePosition)
    XCTAssert(
      monthHeaderItem1.description == "[itemType: .layoutItemType(.monthHeader(2020-01)), frame: (0.0, 100.0, 320.0, 50.0)]",
      "Unexpected initial month header item.")

    let monthHeaderItem2 = verticalVisibleItemsProvider.anchorMonthHeaderItem(
      for: Month(era: 1, year: 2020, month: 03, isInGregorianCalendar: true),
      offset: CGPoint(x: 0, y: 250),
      scrollPosition: .lastFullyVisiblePosition)
    XCTAssert(
      monthHeaderItem2.description == "[itemType: .layoutItemType(.monthHeader(2020-03)), frame: (0.0, 335.5, 320.0, 50.0)]",
      "Unexpected initial month header item.")

    let monthHeaderItem3 = verticalVisibleItemsProvider.anchorMonthHeaderItem(
      for: Month(era: 1, year: 2020, month: 06, isInGregorianCalendar: true),
      offset: CGPoint(x: 0, y: 400),
      scrollPosition: .centered)
    XCTAssert(
      monthHeaderItem3.description == "[itemType: .layoutItemType(.monthHeader(2020-06)), frame: (0.0, 443.0, 320.0, 50.0)]",
      "Unexpected initial month header item.")
  }

  func testVerticalPinnedDaysOfWeekInitialVisibleMonthHeader() {
    let monthHeaderItem1 = verticalPinnedDaysOfWeekVisibleItemsProvider.anchorMonthHeaderItem(
      for: Month(era: 1, year: 2020, month: 02, isInGregorianCalendar: true),
      offset: CGPoint(x: 0, y: 190),
      scrollPosition: .firstFullyVisiblePosition)
    XCTAssert(
      monthHeaderItem1.description == "[itemType: .layoutItemType(.monthHeader(2020-02)), frame: (0.0, 225.5, 320.0, 50.0)]",
      "Unexpected initial month header item.")

    let monthHeaderItem2 = verticalPinnedDaysOfWeekVisibleItemsProvider.anchorMonthHeaderItem(
      for: Month(era: 1, year: 2020, month: 03, isInGregorianCalendar: true),
      offset: CGPoint(x: 0, y: 200),
      scrollPosition: .lastFullyVisiblePosition)
    XCTAssert(
      monthHeaderItem2.description == "[itemType: .layoutItemType(.monthHeader(2020-03)), frame: (0.0, 341.5, 320.0, 50.0)]",
      "Unexpected initial month header item.")

    let monthHeaderItem3 = verticalPinnedDaysOfWeekVisibleItemsProvider.anchorMonthHeaderItem(
      for: Month(era: 1, year: 2020, month: 04, isInGregorianCalendar: true),
      offset: CGPoint(x: 0, y: 250),
      scrollPosition: .centered)
    XCTAssert(
      monthHeaderItem3.description == "[itemType: .layoutItemType(.monthHeader(2020-04)), frame: (0.0, 338.5, 320.0, 50.0)]",
      "Unexpected initial month header item.")
  }

  func testHorizontalInitialVisibleMonthHeader() {
    let monthHeaderItem1 = horizontalVisibleItemsProvider.anchorMonthHeaderItem(
      for: Month(era: 1, year: 2020, month: 11, isInGregorianCalendar: true),
      offset: CGPoint(x: 1000, y: 0),
      scrollPosition: .firstFullyVisiblePosition)
    XCTAssert(
      monthHeaderItem1.description == "[itemType: .layoutItemType(.monthHeader(2020-11)), frame: (1000.0, 0.0, 300.0, 50.0)]",
      "Unexpected initial month header item.")

    let monthHeaderItem2 = horizontalVisibleItemsProvider.anchorMonthHeaderItem(
      for: Month(era: 1, year: 2020, month: 09, isInGregorianCalendar: true),
      offset: CGPoint(x: 800, y: 0),
      scrollPosition: .lastFullyVisiblePosition)
    XCTAssert(
      monthHeaderItem2.description == "[itemType: .layoutItemType(.monthHeader(2020-09)), frame: (820.0, 0.0, 300.0, 50.0)]",
      "Unexpected initial month header item.")

    let monthHeaderItem3 = horizontalVisibleItemsProvider.anchorMonthHeaderItem(
      for: Month(era: 1, year: 2020, month: 10, isInGregorianCalendar: true),
      offset: CGPoint(x: 500, y: 0),
      scrollPosition: .centered)
    XCTAssert(
      monthHeaderItem3.description == "[itemType: .layoutItemType(.monthHeader(2020-10)), frame: (510.0, 0.0, 300.0, 50.0)]",
      "Unexpected initial month header item.")
  }

  func testVerticalInitialVisibleDay() {
    let day = Day(month: Month(era: 1, year: 2020, month: 04, isInGregorianCalendar: true), day: 20)

    let dayItem1 = verticalVisibleItemsProvider.anchorDayItem(
      for: day,
      offset: CGPoint(x: 0, y: 400),
      scrollPosition: .firstFullyVisiblePosition)
    XCTAssert(
      dayItem1.description == "[itemType: .layoutItemType(.day(2020-04-20)), frame: (50.5, 400.0, 36.0, 35.5)]",
      "Unexpected initial day item.")

    let dayItem2 = verticalVisibleItemsProvider.anchorDayItem(
      for: day,
      offset: CGPoint(x: 0, y: 200),
      scrollPosition: .lastFullyVisiblePosition)
    XCTAssert(
      dayItem2.description == "[itemType: .layoutItemType(.day(2020-04-20)), frame: (50.5, 644.5, 36.0, 35.5)]",
      "Unexpected initial day item.")

    let dayItem3 = verticalVisibleItemsProvider.anchorDayItem(
      for: day,
      offset: CGPoint(x: 0, y: 600),
      scrollPosition: .centered)
    XCTAssert(
      dayItem3.description == "[itemType: .layoutItemType(.day(2020-04-20)), frame: (50.5, 822.0, 36.0, 36.0)]",
      "Unexpected initial day item.")
  }

  func testVerticalPinnedDaysOfWeekInitialVisibleDay() {
    let day = Day(month: Month(era: 1, year: 2020, month: 04, isInGregorianCalendar: true), day: 20)

    let dayItem1 = verticalPinnedDaysOfWeekVisibleItemsProvider.anchorDayItem(
      for: day,
      offset: CGPoint(x: 0, y: 0),
      scrollPosition: .firstFullyVisiblePosition)
    XCTAssert(
      dayItem1.description == "[itemType: .layoutItemType(.day(2020-04-20)), frame: (50.5, 35.5, 36.0, 36.0)]",
      "Unexpected initial day item.")

    let dayItem2 = verticalPinnedDaysOfWeekVisibleItemsProvider.anchorDayItem(
      for: day,
      offset: CGPoint(x: 0, y: 100),
      scrollPosition: .lastFullyVisiblePosition)
    XCTAssert(
      dayItem2.description == "[itemType: .layoutItemType(.day(2020-04-20)), frame: (50.5, 544.5, 36.0, 35.5)]",
      "Unexpected initial day item.")

    let dayItem3 = verticalPinnedDaysOfWeekVisibleItemsProvider.anchorDayItem(
      for: day,
      offset: CGPoint(x: 0, y: 1000),
      scrollPosition: .centered)
    XCTAssert(
      dayItem3.description == "[itemType: .layoutItemType(.day(2020-04-20)), frame: (50.5, 1240.0, 36.0, 35.5)]",
      "Unexpected initial day item.")
  }

  func testHorizontalInitialVisibleDay() {
    let day = Day(month: Month(era: 1, year: 2020, month: 04, isInGregorianCalendar: true), day: 20)

    let dayItem1 = horizontalVisibleItemsProvider.anchorDayItem(
      for: day,
      offset: CGPoint(x: 300, y: 0),
      scrollPosition: .firstFullyVisiblePosition)
    XCTAssert(
      dayItem1.description == "[itemType: .layoutItemType(.day(2020-04-20)), frame: (300.0, 291.5, 33.0, 33.0)]",
      "Unexpected initial day item.")

    let dayItem2 = horizontalVisibleItemsProvider.anchorDayItem(
      for: day,
      offset: CGPoint(x: 500, y: 0),
      scrollPosition: .lastFullyVisiblePosition)
    XCTAssert(
      dayItem2.description == "[itemType: .layoutItemType(.day(2020-04-20)), frame: (787.0, 291.5, 33.0, 33.0)]",
      "Unexpected initial day item.")

    let dayItem3 = horizontalVisibleItemsProvider.anchorDayItem(
      for: day,
      offset: CGPoint(x: 0, y: 0),
      scrollPosition: .centered)
    XCTAssert(
      dayItem3.description == "[itemType: .layoutItemType(.day(2020-04-20)), frame: (143.5, 291.5, 33.0, 33.0)]",
      "Unexpected initial day item.")
  }

  // MARK: Scrolled to middle of content tests

  func testVerticalVisibleItemsContext() {
    let details = verticalVisibleItemsProvider.detailsForVisibleItems(
      surroundingPreviouslyVisibleLayoutItem: LayoutItem(
        itemType: .monthHeader(Month(era: 1, year: 2020, month: 03, isInGregorianCalendar: true)),
        frame: CGRect(x: 0, y: 200, width: 320, height: 50)),
      inBounds: CGRect(x: 0, y: 150, width: 320, height: 480))

    let expectedVisibleItemDescriptions: Set<String> = [
      "[itemType: .layoutItemType(.day(2020-03-30)), frame: (50.5, 558.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.dayOfWeekInMonth(.first, 2020-03)), frame: (5.0, 280.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-03-22)), frame: (5.0, 503.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-03-01)), frame: (5.0, 335.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-02-25)), frame: (96.5, 129.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-03-05)), frame: (188.0, 335.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-03-23)), frame: (50.5, 503.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-03-27)), frame: (233.5, 503.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.dayOfWeekInMonth(.third, 2020-03)), frame: (96.5, 280.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.monthHeader(2020-03)), frame: (0.0, 200.0, 320.0, 50.0)]",
      "[itemType: .layoutItemType(.day(2020-03-06)), frame: (233.5, 335.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-03-17)), frame: (96.5, 447.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-03-24)), frame: (96.5, 503.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-03-07)), frame: (279.5, 335.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-03-11)), frame: (142.0, 391.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-02-23)), frame: (5.0, 129.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-03-09)), frame: (50.5, 391.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-03-08)), frame: (5.0, 391.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-03-18)), frame: (142.0, 447.0, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-03-04)), frame: (142.0, 335.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-02-29)), frame: (279.5, 129.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-03-02)), frame: (50.5, 335.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-03-19)), frame: (188.0, 447.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-03-20)), frame: (233.5, 447.0, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-02-24)), frame: (50.5, 129.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.dayOfWeekInMonth(.fifth, 2020-03)), frame: (188.0, 280.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.monthHeader(2020-04)), frame: (0.0, 629.5, 320.0, 50.0)]",
      "[itemType: .layoutItemType(.dayOfWeekInMonth(.last, 2020-03)), frame: (279.5, 280.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-03-29)), frame: (5.0, 558.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-03-15)), frame: (5.0, 447.0, 35.5, 36.0)]",
      "[itemType: .dayRange(2020-03-11, 2020-04-05), frame: (5.0, 391.5, 310.0, 465.0)]",
      "[itemType: .layoutItemType(.day(2020-03-21)), frame: (279.5, 447.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.dayOfWeekInMonth(.second, 2020-03)), frame: (50.5, 280.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-03-26)), frame: (188.0, 503.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.dayOfWeekInMonth(.fourth, 2020-03)), frame: (142.0, 280.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-03-13)), frame: (233.5, 391.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-03-14)), frame: (279.5, 391.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-02-28)), frame: (233.5, 129.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-03-03)), frame: (96.5, 335.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-02-26)), frame: (142.0, 129.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-03-31)), frame: (96.5, 558.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-03-16)), frame: (50.5, 447.0, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-03-10)), frame: (96.5, 391.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-02-27)), frame: (188.0, 129.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-03-12)), frame: (188.0, 391.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-03-28)), frame: (279.5, 503.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-03-25)), frame: (142.0, 503.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.dayOfWeekInMonth(.sixth, 2020-03)), frame: (233.5, 280.0, 36.0, 35.5)]",
    ]

    XCTAssert(
      Set(details.visibleItems.map { $0.description }) == expectedVisibleItemDescriptions,
      "Unexpected visible items.")

    XCTAssert(
      details.centermostLayoutItem.description == "[itemType: .layoutItemType(.day(2020-03-11)), frame: (142.0, 391.5, 36.0, 35.5)]",
      "Unexpected centermost layout item.")

    XCTAssert(details.minimumScrollOffset == nil, "Unexpected minimum scroll offset.")
    XCTAssert(details.maximumScrollOffset == nil, "Unexpected maximum scroll offset.")
  }

  func testVerticalPinnedDaysOfWeekVisibleItemsContext() {
    let details = verticalPinnedDaysOfWeekVisibleItemsProvider.detailsForVisibleItems(
      surroundingPreviouslyVisibleLayoutItem: LayoutItem(
        itemType: .monthHeader(Month(era: 1, year: 2020, month: 06, isInGregorianCalendar: true)),
        frame: CGRect(x: 0, y: 450, width: 320, height: 40)),
      inBounds: CGRect(x: 0, y: 450, width: 320, height: 480))

    let expectedVisibleItemDescriptions: Set<String> = [
      "[itemType: .layoutItemType(.day(2020-06-15)), frame: (50.5, 641.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-06-29)), frame: (50.5, 753.0, 36.0, 35.5)]",
      "[itemType: .pinnedDayOfWeek(.fifth), frame: (188.0, 450.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-07-03)), frame: (233.5, 903.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-06-04)), frame: (188.0, 530.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-06-25)), frame: (188.0, 697.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-06-26)), frame: (233.5, 697.0, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-06-28)), frame: (5.0, 753.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-06-13)), frame: (279.5, 585.5, 35.5, 36.0)]",
      "[itemType: .pinnedDayOfWeek(.first), frame: (5.0, 450.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-06-02)), frame: (96.5, 530.0, 35.5, 35.5)]",
      "[itemType: .pinnedDayOfWeek(.fourth), frame: (142.0, 450.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-06-12)), frame: (233.5, 585.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-06-14)), frame: (5.0, 641.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-06-11)), frame: (188.0, 585.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-06-20)), frame: (279.5, 641.5, 35.5, 35.5)]",
      "[itemType: .pinnedDayOfWeek(.last), frame: (279.5, 450.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-06-19)), frame: (233.5, 641.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-06-10)), frame: (142.0, 585.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-06-17)), frame: (142.0, 641.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-06-23)), frame: (96.5, 697.0, 35.5, 36.0)]",
      "[itemType: .pinnedDayOfWeek(.sixth), frame: (233.5, 450.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-06-07)), frame: (5.0, 585.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-07-01)), frame: (142.0, 903.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-06-24)), frame: (142.0, 697.0, 36.0, 36.0)]",
      "[itemType: .pinnedDayOfWeek(.third), frame: (96.5, 450.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-06-03)), frame: (142.0, 530.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.monthHeader(2020-06)), frame: (0.0, 450.0, 320.0, 50.0)]",
      "[itemType: .layoutItemType(.monthHeader(2020-07)), frame: (0.0, 823.5, 320.0, 50.0)]",
      "[itemType: .pinnedDayOfWeek(.second), frame: (50.5, 450.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-06-08)), frame: (50.5, 585.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-06-01)), frame: (50.5, 530.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-07-02)), frame: (188.0, 903.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-06-21)), frame: (5.0, 697.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-06-30)), frame: (96.5, 753.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-06-05)), frame: (233.5, 530.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-07-04)), frame: (279.5, 903.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-06-22)), frame: (50.5, 697.0, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-06-27)), frame: (279.5, 697.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-06-09)), frame: (96.5, 585.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-06-18)), frame: (188.0, 641.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-06-16)), frame: (96.5, 641.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-06-06)), frame: (279.5, 530.0, 35.5, 35.5)]",
    ]

    XCTAssert(
      Set(details.visibleItems.map { $0.description }) == expectedVisibleItemDescriptions,
      "Unexpected visible items.")

    XCTAssert(
      details.centermostLayoutItem.description == "[itemType: .layoutItemType(.day(2020-06-24)), frame: (142.0, 697.0, 36.0, 36.0)]",
      "Unexpected centermost layout item.")

    XCTAssert(details.minimumScrollOffset == nil, "Unexpected minimum scroll offset.")
    XCTAssert(details.maximumScrollOffset == nil, "Unexpected maximum scroll offset.")
  }

  func testHorizontalVisibleItemsContext() {
    let details = horizontalVisibleItemsProvider.detailsForVisibleItems(
      surroundingPreviouslyVisibleLayoutItem: LayoutItem(
        itemType: .monthHeader(Month(era: 1, year: 2020, month: 05, isInGregorianCalendar: true)),
        frame: CGRect(x: 250, y: 0, width: 300, height: 50)),
      inBounds: CGRect(x: 100, y: 0, width: 300, height: 480))

    let expectedVisibleItemDescriptions: Set<String> = [
      "[itemType: .layoutItemType(.day(2020-05-06)), frame: (383.5, 185.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-04-03)), frame: (154.5, 133.0, 32.5, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-04-24)), frame: (154.5, 291.5, 32.5, 33.0)]",
      "[itemType: .dayRange(2020-03-11, 2020-04-05), frame: (-375.0, 133.0, 605.0, 244.0)]",
      "[itemType: .layoutItemType(.day(2020-04-04)), frame: (197.0, 133.0, 33.0, 32.5)]",
      "[itemType: .layoutItemType(.dayOfWeekInMonth(.last, 2020-04)), frame: (197.0, 80.0, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-04-17)), frame: (154.5, 238.5, 32.5, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-04-08)), frame: (68.5, 185.5, 33.0, 33.0)]",
      "[itemType: .dayRange(2020-04-30, 2020-05-14), frame: (111.5, 133.0, 433.5, 244.0)]",
      "[itemType: .layoutItemType(.day(2020-05-18)), frame: (298.0, 291.5, 32.5, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-04-25)), frame: (197.0, 291.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-04-10)), frame: (154.5, 185.5, 32.5, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-05-12)), frame: (340.5, 238.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-04-29)), frame: (68.5, 344.5, 33.0, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-04-30)), frame: (111.5, 344.5, 33.0, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-05-11)), frame: (298.0, 238.5, 32.5, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-04-11)), frame: (197.0, 185.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-04-22)), frame: (68.5, 291.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-05-03)), frame: (255.0, 185.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.dayOfWeekInMonth(.fifth, 2020-04)), frame: (111.5, 80.0, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-05-20)), frame: (383.5, 291.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.dayOfWeekInMonth(.third, 2020-05)), frame: (340.5, 80.0, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.dayOfWeekInMonth(.first, 2020-05)), frame: (255.0, 80.0, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-05-19)), frame: (340.5, 291.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-04-16)), frame: (111.5, 238.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-04-01)), frame: (68.5, 133.0, 33.0, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-04-23)), frame: (111.5, 291.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.dayOfWeekInMonth(.second, 2020-05)), frame: (298.0, 80.0, 32.5, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-05-27)), frame: (383.5, 344.5, 33.0, 32.5)]",
      "[itemType: .layoutItemType(.monthHeader(2020-04)), frame: (-65.0, 0.0, 300.0, 50.0)]",
      "[itemType: .layoutItemType(.day(2020-05-05)), frame: (340.5, 185.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-05-17)), frame: (255.0, 291.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-04-09)), frame: (111.5, 185.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-05-10)), frame: (255.0, 238.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-05-13)), frame: (383.5, 238.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-05-31)), frame: (255.0, 397.0, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-05-26)), frame: (340.5, 344.5, 33.0, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-05-25)), frame: (298.0, 344.5, 32.5, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-05-24)), frame: (255.0, 344.5, 33.0, 32.5)]",
      "[itemType: .layoutItemType(.dayOfWeekInMonth(.sixth, 2020-04)), frame: (154.5, 80.0, 32.5, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-05-04)), frame: (298.0, 185.5, 32.5, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-04-02)), frame: (111.5, 133.0, 33.0, 32.5)]",
      "[itemType: .layoutItemType(.dayOfWeekInMonth(.fourth, 2020-05)), frame: (383.5, 80.0, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.dayOfWeekInMonth(.fourth, 2020-04)), frame: (68.5, 80.0, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.monthHeader(2020-05)), frame: (250.0, 0.0, 300.0, 50.0)]",
      "[itemType: .layoutItemType(.day(2020-04-15)), frame: (68.5, 238.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-04-18)), frame: (197.0, 238.5, 33.0, 33.0)]",
    ]

    XCTAssert(
      Set(details.visibleItems.map { $0.description }) == expectedVisibleItemDescriptions,
      "Unexpected visible items.")

    XCTAssert(
      details.centermostLayoutItem.description == "[itemType: .layoutItemType(.day(2020-05-10)), frame: (255.0, 238.5, 33.0, 33.0)]",
      "Unexpected centermost layout item.")

    XCTAssert(details.minimumScrollOffset == nil, "Unexpected minimum scroll offset.")
    XCTAssert(details.maximumScrollOffset == nil, "Unexpected maximum scroll offset.")
  }

  func testLargeScrollOffsetSincePreviouslyVisibleItem() {
    let details = verticalVisibleItemsProvider.detailsForVisibleItems(
      surroundingPreviouslyVisibleLayoutItem: LayoutItem(
        itemType: .monthHeader(Month(era: 1, year: 2020, month: 12, isInGregorianCalendar: true)),
        frame: CGRect(x: 0, y: 3000, width: 320, height: 50)),
      inBounds: CGRect(x: 0, y: 150, width: 320, height: 480))

    let expectedVisibleItemDescriptions: Set<String> = [
      "[itemType: .layoutItemType(.day(2020-05-22)), frame: (233.5, 186.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-06-19)), frame: (233.5, 615.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-06-08)), frame: (50.5, 560.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-06-09)), frame: (96.5, 560.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-06-16)), frame: (96.5, 615.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-05-20)), frame: (142.0, 186.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-05-11)), frame: (50.5, 130.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-05-31)), frame: (5.0, 298.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-06-04)), frame: (188.0, 504.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.dayOfWeekInMonth(.second, 2020-06)), frame: (50.5, 448.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-05-25)), frame: (50.5, 242.0, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.monthHeader(2020-06)), frame: (0.0, 368.5, 320.0, 50.0)]",
      "[itemType: .layoutItemType(.dayOfWeekInMonth(.third, 2020-06)), frame: (96.5, 448.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-05-26)), frame: (96.5, 242.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-05-24)), frame: (5.0, 242.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.dayOfWeekInMonth(.sixth, 2020-06)), frame: (233.5, 448.5, 36.0, 36.0)]",
      "[itemType: .dayRange(2020-04-30, 2020-05-14), frame: (5.0, -187.0, 310.0, 353.5)]",
      "[itemType: .layoutItemType(.day(2020-05-21)), frame: (188.0, 186.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.dayOfWeekInMonth(.fifth, 2020-06)), frame: (188.0, 448.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.dayOfWeekInMonth(.last, 2020-06)), frame: (279.5, 448.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-06-20)), frame: (279.5, 615.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-05-14)), frame: (188.0, 130.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-06-01)), frame: (50.5, 504.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-06-14)), frame: (5.0, 615.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-06-07)), frame: (5.0, 560.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-05-18)), frame: (50.5, 186.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-06-17)), frame: (142.0, 615.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-06-15)), frame: (50.5, 615.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-06-02)), frame: (96.5, 504.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-05-13)), frame: (142.0, 130.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-06-18)), frame: (188.0, 615.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-06-13)), frame: (279.5, 560.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-06-06)), frame: (279.5, 504.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-05-15)), frame: (233.5, 130.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-05-17)), frame: (5.0, 186.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-06-05)), frame: (233.5, 504.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-05-10)), frame: (5.0, 130.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-06-11)), frame: (188.0, 560.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-06-10)), frame: (142.0, 560.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-06-12)), frame: (233.5, 560.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.dayOfWeekInMonth(.fourth, 2020-06)), frame: (142.0, 448.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-05-12)), frame: (96.5, 130.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-05-16)), frame: (279.5, 130.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-05-30)), frame: (279.5, 242.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-05-29)), frame: (233.5, 242.0, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.dayOfWeekInMonth(.first, 2020-06)), frame: (5.0, 448.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-05-23)), frame: (279.5, 186.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-05-28)), frame: (188.0, 242.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-06-03)), frame: (142.0, 504.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-05-19)), frame: (96.5, 186.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-05-27)), frame: (142.0, 242.0, 36.0, 36.0)]",
    ]

    XCTAssert(
      Set(details.visibleItems.map { $0.description }) == expectedVisibleItemDescriptions,
      "Unexpected visible items.")

    XCTAssert(
      details.centermostLayoutItem.description == "[itemType: .layoutItemType(.monthHeader(2020-06)), frame: (0.0, 368.5, 320.0, 50.0)]"				,
      "Unexpected centermost layout item.")

    XCTAssert(details.minimumScrollOffset == nil, "Unexpected minimum scroll offset.")
    XCTAssert(details.maximumScrollOffset == nil, "Unexpected maximum scroll offset.")
  }

  // MARK: Scrolled to content boundary tests

  func testBoundaryVerticalVisibleItemsContext() {
    let details = verticalVisibleItemsProvider.detailsForVisibleItems(
      surroundingPreviouslyVisibleLayoutItem: LayoutItem(
        itemType: .monthHeader(Month(era: 1, year: 2020, month: 01, isInGregorianCalendar: true)),
        frame: CGRect(x: 0, y: 0, width: 320, height: 50)),
      inBounds: CGRect(x: 0, y: -50, width: 320, height: 480))

    let expectedVisibleItemDescriptions: Set<String> = [
      "[itemType: .layoutItemType(.day(2020-01-19)), frame: (5.0, 303.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-01-01)), frame: (142.0, 135.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.dayOfWeekInMonth(.fifth, 2020-01)), frame: (188.0, 80.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-01-27)), frame: (50.5, 358.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.dayOfWeekInMonth(.third, 2020-01)), frame: (96.5, 80.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-01-29)), frame: (142.0, 358.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-01-22)), frame: (142.0, 303.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-01-30)), frame: (188.0, 358.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-01-24)), frame: (233.5, 303.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-01-31)), frame: (233.5, 358.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-01-03)), frame: (233.5, 135.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-01-23)), frame: (188.0, 303.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-01-09)), frame: (188.0, 191.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.dayOfWeekInMonth(.second, 2020-01)), frame: (50.5, 80.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-01-21)), frame: (96.5, 303.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-01-11)), frame: (279.5, 191.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-01-25)), frame: (279.5, 303.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-01-04)), frame: (279.5, 135.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-01-06)), frame: (50.5, 191.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-01-02)), frame: (188.0, 135.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-01-28)), frame: (96.5, 358.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-01-14)), frame: (96.5, 247.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-01-16)), frame: (188.0, 247.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-01-15)), frame: (142.0, 247.0, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-01-13)), frame: (50.5, 247.0, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.dayOfWeekInMonth(.fourth, 2020-01)), frame: (142.0, 80.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-01-05)), frame: (5.0, 191.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.monthHeader(2020-01)), frame: (0.0, 0.0, 320.0, 50.0)]",
      "[itemType: .layoutItemType(.day(2020-01-08)), frame: (142.0, 191.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-01-18)), frame: (279.5, 247.0, 35.5, 36.0)]",
      "[itemType: .overlayItem(.day(2020-1-19)), frame: (0.0, -50.0, 320.0, 480.0)]",
      "[itemType: .layoutItemType(.day(2020-01-10)), frame: (233.5, 191.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-01-17)), frame: (233.5, 247.0, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-01-12)), frame: (5.0, 247.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-01-07)), frame: (96.5, 191.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.monthHeader(2020-02)), frame: (0.0, 429.5, 320.0, 50.0)]",
      "[itemType: .layoutItemType(.dayOfWeekInMonth(.sixth, 2020-01)), frame: (233.5, 80.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.dayOfWeekInMonth(.last, 2020-01)), frame: (279.5, 80.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-01-26)), frame: (5.0, 358.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.dayOfWeekInMonth(.first, 2020-01)), frame: (5.0, 80.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-01-20)), frame: (50.5, 303.0, 36.0, 35.5)]",
    ]

    XCTAssert(
      Set(details.visibleItems.map { $0.description }) == expectedVisibleItemDescriptions,
      "Unexpected visible items.")

    XCTAssert(
      details.centermostLayoutItem.description == "[itemType: .layoutItemType(.day(2020-01-08)), frame: (142.0, 191.5, 36.0, 35.5)]",
      "Unexpected centermost layout item.")

    XCTAssert(details.minimumScrollOffset == 0, "Unexpected minimum scroll offset.")
    XCTAssert(details.maximumScrollOffset == nil, "Unexpected maximum scroll offset.")
  }

  func testBoundaryVerticalPinnedDaysOfWeekVisibleItemsContext() {
    let details = verticalPinnedDaysOfWeekVisibleItemsProvider.detailsForVisibleItems(
      surroundingPreviouslyVisibleLayoutItem: LayoutItem(
        itemType: .monthHeader(Month(era: 1, year: 2020, month: 01, isInGregorianCalendar: true)),
        frame: CGRect(x: 0, y: 45, width: 320, height: 40)),
      inBounds: CGRect(x: 0, y: 50, width: 320, height: 480))

    let expectedVisibleItemDescriptions: Set<String> = [
      "[itemType: .layoutItemType(.day(2020-01-07)), frame: (96.5, 180.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-01-21)), frame: (96.5, 292.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-01-22)), frame: (142.0, 292.0, 36.0, 36.0)]",
      "[itemType: .pinnedDayOfWeek(.fifth), frame: (188.0, 50.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-01-12)), frame: (5.0, 236.5, 35.5, 35.5)]",
      "[itemType: .pinnedDayOfWeek(.sixth), frame: (233.5, 50.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-01-17)), frame: (233.5, 236.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-01-30)), frame: (188.0, 348.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-01-20)), frame: (50.5, 292.0, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-01-31)), frame: (233.5, 348.0, 36.0, 35.5)]",
      "[itemType: .pinnedDayOfWeek(.second), frame: (50.5, 50.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-01-01)), frame: (142.0, 125.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-01-14)), frame: (96.5, 236.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-01-16)), frame: (188.0, 236.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-01-02)), frame: (188.0, 125.0, 35.5, 35.5)]",
      "[itemType: .pinnedDayOfWeek(.first), frame: (5.0, 50.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-01-29)), frame: (142.0, 348.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-01-11)), frame: (279.5, 180.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-01-10)), frame: (233.5, 180.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-01-15)), frame: (142.0, 236.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-01-03)), frame: (233.5, 125.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-01-25)), frame: (279.5, 292.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-01-26)), frame: (5.0, 348.0, 35.5, 35.5)]",
      "[itemType: .pinnedDayOfWeek(.last), frame: (279.5, 50.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-01-13)), frame: (50.5, 236.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-01-28)), frame: (96.5, 348.0, 35.5, 35.5)]",
      "[itemType: .overlayItem(.day(2020-1-19)), frame: (0.0, 50.0, 320.0, 480.0)]",
      "[itemType: .layoutItemType(.day(2020-01-27)), frame: (50.5, 348.0, 36.0, 35.5)]",
      "[itemType: .pinnedDayOfWeek(.fourth), frame: (142.0, 50.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-01-18)), frame: (279.5, 236.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-01-08)), frame: (142.0, 180.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-01-09)), frame: (188.0, 180.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-01-04)), frame: (279.5, 125.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.monthHeader(2020-02)), frame: (0.0, 418.5, 320.0, 50.0)]",
      "[itemType: .layoutItemType(.monthHeader(2020-01)), frame: (0.0, 45.0, 320.0, 50.0)]",
      "[itemType: .pinnedDayOfWeek(.third), frame: (96.5, 50.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-01-23)), frame: (188.0, 292.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-01-05)), frame: (5.0, 180.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-02-01)), frame: (279.5, 498.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-01-19)), frame: (5.0, 292.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-01-06)), frame: (50.5, 180.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-01-24)), frame: (233.5, 292.0, 36.0, 36.0)]",
    ]

    XCTAssert(
      Set(details.visibleItems.map { $0.description }) == expectedVisibleItemDescriptions,
      "Unexpected visible items.")

    XCTAssert(
      details.centermostLayoutItem.description == "[itemType: .layoutItemType(.day(2020-01-22)), frame: (142.0, 292.0, 36.0, 36.0)]",
      "Unexpected centermost layout item.")

    XCTAssert(
      details.minimumScrollOffset?.alignedToPixel(forScreenWithScale: 2) == 9.5,
      "Unexpected minimum scroll offset.")
    XCTAssert(details.maximumScrollOffset == nil, "Unexpected maximum scroll offset.")
  }

  func testBoundaryHorizontalVisibleItemsContext() {
    let details = horizontalVisibleItemsProvider.detailsForVisibleItems(
      surroundingPreviouslyVisibleLayoutItem: LayoutItem(
        itemType: .monthHeader(Month(era: 1, year: 2020, month: 12, isInGregorianCalendar: true)),
        frame: CGRect(x: 1200, y: 0, width: 300, height: 50)),
      inBounds: CGRect(x: 1000, y: 0, width: 300, height: 480))

    let expectedVisibleItemDescriptions: Set<String> = [
      "[itemType: .layoutItemType(.day(2020-11-24)), frame: (975.5, 291.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-11-07)), frame: (1147.0, 133.0, 33.0, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-11-10)), frame: (975.5, 185.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-12-15)), frame: (1290.5, 238.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-11-13)), frame: (1104.5, 185.5, 32.5, 33.0)]",
      "[itemType: .layoutItemType(.dayOfWeekInMonth(.sixth, 2020-11)), frame: (1104.5, 80.0, 32.5, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-11-17)), frame: (975.5, 238.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-11-27)), frame: (1104.5, 291.5, 32.5, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-11-12)), frame: (1061.5, 185.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-11-05)), frame: (1061.5, 133.0, 33.0, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-11-21)), frame: (1147.0, 238.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.dayOfWeekInMonth(.first, 2020-12)), frame: (1205.0, 80.0, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-12-21)), frame: (1248.0, 291.5, 32.5, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-12-28)), frame: (1248.0, 344.5, 32.5, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-11-11)), frame: (1018.5, 185.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-12-06)), frame: (1205.0, 185.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.dayOfWeekInMonth(.third, 2020-12)), frame: (1290.5, 80.0, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-11-14)), frame: (1147.0, 185.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-11-25)), frame: (1018.5, 291.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-11-06)), frame: (1104.5, 133.0, 32.5, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-12-08)), frame: (1290.5, 185.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-11-26)), frame: (1061.5, 291.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-11-20)), frame: (1104.5, 238.5, 32.5, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-12-14)), frame: (1248.0, 238.5, 32.5, 33.0)]",
      "[itemType: .overlayItem(.monthHeader(2020-11)), frame: (1000.0, 0.0, 300.0, 480.0)]",
      "[itemType: .layoutItemType(.dayOfWeekInMonth(.last, 2020-11)), frame: (1147.0, 80.0, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-12-13)), frame: (1205.0, 238.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-11-03)), frame: (975.5, 133.0, 33.0, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-12-29)), frame: (1290.5, 344.5, 33.0, 32.5)]",
      "[itemType: .layoutItemType(.monthHeader(2020-12)), frame: (1200.0, 0.0, 300.0, 50.0)]",
      "[itemType: .layoutItemType(.day(2020-11-28)), frame: (1147.0, 291.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-11-18)), frame: (1018.5, 238.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-11-04)), frame: (1018.5, 133.0, 33.0, 32.5)]",
      "[itemType: .layoutItemType(.dayOfWeekInMonth(.third, 2020-11)), frame: (975.5, 80.0, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-11-19)), frame: (1061.5, 238.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-12-22)), frame: (1290.5, 291.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.dayOfWeekInMonth(.fourth, 2020-11)), frame: (1018.5, 80.0, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.dayOfWeekInMonth(.fifth, 2020-11)), frame: (1061.5, 80.0, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-12-01)), frame: (1290.5, 133.0, 33.0, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-12-20)), frame: (1205.0, 291.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.monthHeader(2020-11)), frame: (885.0, 0.0, 300.0, 50.0)]",
      "[itemType: .layoutItemType(.dayOfWeekInMonth(.second, 2020-12)), frame: (1248.0, 80.0, 32.5, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-12-07)), frame: (1248.0, 185.5, 32.5, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-12-27)), frame: (1205.0, 344.5, 33.0, 32.5)]",
    ]

    XCTAssert(
      Set(details.visibleItems.map { $0.description }) == expectedVisibleItemDescriptions,
      "Unexpected visible items.")

    XCTAssert(
      details.centermostLayoutItem.description == "[itemType: .layoutItemType(.day(2020-11-21)), frame: (1147.0, 238.5, 33.0, 33.0)]",
      "Unexpected centermost layout item.")

    XCTAssert(details.minimumScrollOffset == nil, "Unexpected minimum scroll offset.")
    XCTAssert(details.maximumScrollOffset == 1500, "Unexpected maximum scroll offset.")
  }

  // MARK: Accessibility tests

  func testVerticalVisibleItemsForAccessibility() {
    let visibleItems = verticalVisibleItemsProvider.visibleItemsForAccessibilityElements(
      surroundingPreviouslyVisibleLayoutItem: LayoutItem(
        itemType: .monthHeader(Month(era: 1, year: 2020, month: 04, isInGregorianCalendar: true)),
        frame: CGRect(x: 0, y: 1200, width: 320, height: 50)),
      visibleMonthRange: .init(
        uncheckedBounds: (
          lower: Month(era: 1, year: 2020, month: 03, isInGregorianCalendar: true),
          upper: Month(era: 1, year: 2020, month: 06, isInGregorianCalendar: true))))

    let expectedVisibleItems = [
      "[itemType: .layoutItemType(.monthHeader(2020-02)), frame: (0.0, 341.5, 320.0, 50.0)]",
      "[itemType: .layoutItemType(.day(2020-02-01)), frame: (279.5, 477.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-02-02)), frame: (5.0, 533.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-02-03)), frame: (50.5, 533.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-02-04)), frame: (96.5, 533.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-02-05)), frame: (142.0, 533.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-02-06)), frame: (188.0, 533.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-02-07)), frame: (233.5, 533.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-02-08)), frame: (279.5, 533.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-02-09)), frame: (5.0, 588.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-02-10)), frame: (50.5, 588.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-02-11)), frame: (96.5, 588.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-02-12)), frame: (142.0, 588.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-02-13)), frame: (188.0, 588.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-02-14)), frame: (233.5, 588.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-02-15)), frame: (279.5, 588.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-02-16)), frame: (5.0, 644.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-02-17)), frame: (50.5, 644.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-02-18)), frame: (96.5, 644.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-02-19)), frame: (142.0, 644.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-02-20)), frame: (188.0, 644.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-02-21)), frame: (233.5, 644.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-02-22)), frame: (279.5, 644.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-02-23)), frame: (5.0, 700.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-02-24)), frame: (50.5, 700.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-02-25)), frame: (96.5, 700.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-02-26)), frame: (142.0, 700.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-02-27)), frame: (188.0, 700.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-02-28)), frame: (233.5, 700.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-02-29)), frame: (279.5, 700.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.monthHeader(2020-03)), frame: (0.0, 770.5, 320.0, 50.0)]",
      "[itemType: .layoutItemType(.day(2020-03-01)), frame: (5.0, 906.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-03-02)), frame: (50.5, 906.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-03-03)), frame: (96.5, 906.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-03-04)), frame: (142.0, 906.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-03-05)), frame: (188.0, 906.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-03-06)), frame: (233.5, 906.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-03-07)), frame: (279.5, 906.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-03-08)), frame: (5.0, 962.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-03-09)), frame: (50.5, 962.0, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-03-10)), frame: (96.5, 962.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-03-11)), frame: (142.0, 962.0, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-03-12)), frame: (188.0, 962.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-03-13)), frame: (233.5, 962.0, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-03-14)), frame: (279.5, 962.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-03-15)), frame: (5.0, 1018.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-03-16)), frame: (50.5, 1018.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-03-17)), frame: (96.5, 1018.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-03-18)), frame: (142.0, 1018.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-03-19)), frame: (188.0, 1018.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-03-20)), frame: (233.5, 1018.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-03-21)), frame: (279.5, 1018.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-03-22)), frame: (5.0, 1073.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-03-23)), frame: (50.5, 1073.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-03-24)), frame: (96.5, 1073.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-03-25)), frame: (142.0, 1073.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-03-26)), frame: (188.0, 1073.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-03-27)), frame: (233.5, 1073.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-03-28)), frame: (279.5, 1073.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-03-29)), frame: (5.0, 1129.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-03-30)), frame: (50.5, 1129.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-03-31)), frame: (96.5, 1129.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.monthHeader(2020-04)), frame: (0.0, 1200.0, 320.0, 50.0)]",
      "[itemType: .layoutItemType(.day(2020-04-01)), frame: (142.0, 1335.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-04-02)), frame: (188.0, 1335.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-04-03)), frame: (233.5, 1335.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-04-04)), frame: (279.5, 1335.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-04-05)), frame: (5.0, 1391.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-04-06)), frame: (50.5, 1391.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-04-07)), frame: (96.5, 1391.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-04-08)), frame: (142.0, 1391.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-04-09)), frame: (188.0, 1391.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-04-10)), frame: (233.5, 1391.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-04-11)), frame: (279.5, 1391.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-04-12)), frame: (5.0, 1447.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-04-13)), frame: (50.5, 1447.0, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-04-14)), frame: (96.5, 1447.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-04-15)), frame: (142.0, 1447.0, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-04-16)), frame: (188.0, 1447.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-04-17)), frame: (233.5, 1447.0, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-04-18)), frame: (279.5, 1447.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-04-19)), frame: (5.0, 1503.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-04-20)), frame: (50.5, 1503.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-04-21)), frame: (96.5, 1503.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-04-22)), frame: (142.0, 1503.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-04-23)), frame: (188.0, 1503.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-04-24)), frame: (233.5, 1503.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-04-25)), frame: (279.5, 1503.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-04-26)), frame: (5.0, 1558.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-04-27)), frame: (50.5, 1558.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-04-28)), frame: (96.5, 1558.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-04-29)), frame: (142.0, 1558.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-04-30)), frame: (188.0, 1558.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.monthHeader(2020-05)), frame: (0.0, 1629.5, 320.0, 50.0)]",
      "[itemType: .layoutItemType(.day(2020-05-01)), frame: (233.5, 1765.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-05-02)), frame: (279.5, 1765.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-05-03)), frame: (5.0, 1820.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-05-04)), frame: (50.5, 1820.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-05-05)), frame: (96.5, 1820.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-05-06)), frame: (142.0, 1820.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-05-07)), frame: (188.0, 1820.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-05-08)), frame: (233.5, 1820.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-05-09)), frame: (279.5, 1820.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-05-10)), frame: (5.0, 1876.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-05-11)), frame: (50.5, 1876.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-05-12)), frame: (96.5, 1876.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-05-13)), frame: (142.0, 1876.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-05-14)), frame: (188.0, 1876.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-05-15)), frame: (233.5, 1876.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-05-16)), frame: (279.5, 1876.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-05-17)), frame: (5.0, 1932.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-05-18)), frame: (50.5, 1932.0, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-05-19)), frame: (96.5, 1932.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-05-20)), frame: (142.0, 1932.0, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-05-21)), frame: (188.0, 1932.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-05-22)), frame: (233.5, 1932.0, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-05-23)), frame: (279.5, 1932.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-05-24)), frame: (5.0, 1988.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-05-25)), frame: (50.5, 1988.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-05-26)), frame: (96.5, 1988.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-05-27)), frame: (142.0, 1988.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-05-28)), frame: (188.0, 1988.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-05-29)), frame: (233.5, 1988.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-05-30)), frame: (279.5, 1988.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-05-31)), frame: (5.0, 2043.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.monthHeader(2020-06)), frame: (0.0, 2114.5, 320.0, 50.0)]",
      "[itemType: .layoutItemType(.day(2020-06-01)), frame: (50.5, 2250.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-06-02)), frame: (96.5, 2250.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-06-03)), frame: (142.0, 2250.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-06-04)), frame: (188.0, 2250.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-06-05)), frame: (233.5, 2250.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-06-06)), frame: (279.5, 2250.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-06-07)), frame: (5.0, 2305.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-06-08)), frame: (50.5, 2305.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-06-09)), frame: (96.5, 2305.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-06-10)), frame: (142.0, 2305.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-06-11)), frame: (188.0, 2305.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-06-12)), frame: (233.5, 2305.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-06-13)), frame: (279.5, 2305.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-06-14)), frame: (5.0, 2361.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-06-15)), frame: (50.5, 2361.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-06-16)), frame: (96.5, 2361.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-06-17)), frame: (142.0, 2361.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-06-18)), frame: (188.0, 2361.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-06-19)), frame: (233.5, 2361.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-06-20)), frame: (279.5, 2361.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-06-21)), frame: (5.0, 2417.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-06-22)), frame: (50.5, 2417.0, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-06-23)), frame: (96.5, 2417.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-06-24)), frame: (142.0, 2417.0, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-06-25)), frame: (188.0, 2417.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-06-26)), frame: (233.5, 2417.0, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-06-27)), frame: (279.5, 2417.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-06-28)), frame: (5.0, 2473.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-06-29)), frame: (50.5, 2473.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-06-30)), frame: (96.5, 2473.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.monthHeader(2020-07)), frame: (0.0, 2543.5, 320.0, 50.0)]",
      "[itemType: .layoutItemType(.day(2020-07-01)), frame: (142.0, 2679.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-07-02)), frame: (188.0, 2679.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-07-03)), frame: (233.5, 2679.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-07-04)), frame: (279.5, 2679.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-07-05)), frame: (5.0, 2735.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-07-06)), frame: (50.5, 2735.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-07-07)), frame: (96.5, 2735.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-07-08)), frame: (142.0, 2735.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-07-09)), frame: (188.0, 2735.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-07-10)), frame: (233.5, 2735.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-07-11)), frame: (279.5, 2735.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-07-12)), frame: (5.0, 2790.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-07-13)), frame: (50.5, 2790.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-07-14)), frame: (96.5, 2790.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-07-15)), frame: (142.0, 2790.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-07-16)), frame: (188.0, 2790.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-07-17)), frame: (233.5, 2790.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-07-18)), frame: (279.5, 2790.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-07-19)), frame: (5.0, 2846.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-07-20)), frame: (50.5, 2846.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-07-21)), frame: (96.5, 2846.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-07-22)), frame: (142.0, 2846.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-07-23)), frame: (188.0, 2846.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-07-24)), frame: (233.5, 2846.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-07-25)), frame: (279.5, 2846.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-07-26)), frame: (5.0, 2902.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-07-27)), frame: (50.5, 2902.0, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-07-28)), frame: (96.5, 2902.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-07-29)), frame: (142.0, 2902.0, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-07-30)), frame: (188.0, 2902.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-07-31)), frame: (233.5, 2902.0, 36.0, 36.0)]",
    ]

    XCTAssert(
      visibleItems.map { $0.description } == expectedVisibleItems,
      "Unexpected visible items.")
  }

  func testVerticalPinnedDaysOfWeekItemsForAccessibility() {
    let visibleItems = verticalPinnedDaysOfWeekVisibleItemsProvider.visibleItemsForAccessibilityElements(
      surroundingPreviouslyVisibleLayoutItem: LayoutItem(
        itemType: .monthHeader(Month(era: 1, year: 2020, month: 12, isInGregorianCalendar: true)),
        frame: CGRect(x: 0, y: 2000, width: 320, height: 50)),
      visibleMonthRange: .init(
        uncheckedBounds: (
          lower: Month(era: 1, year: 2020, month: 11, isInGregorianCalendar: true),
          upper: Month(era: 1, year: 2020, month: 12, isInGregorianCalendar: true))))

    let expectedVisibleItems = [
      "[itemType: .layoutItemType(.monthHeader(2020-10)), frame: (0.0, 1253.0, 320.0, 50.0)]",
      "[itemType: .layoutItemType(.day(2020-10-01)), frame: (188.0, 1333.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-10-02)), frame: (233.5, 1333.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-10-03)), frame: (279.5, 1333.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-10-04)), frame: (5.0, 1388.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-10-05)), frame: (50.5, 1388.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-10-06)), frame: (96.5, 1388.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-10-07)), frame: (142.0, 1388.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-10-08)), frame: (188.0, 1388.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-10-09)), frame: (233.5, 1388.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-10-10)), frame: (279.5, 1388.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-10-11)), frame: (5.0, 1444.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-10-12)), frame: (50.5, 1444.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-10-13)), frame: (96.5, 1444.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-10-14)), frame: (142.0, 1444.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-10-15)), frame: (188.0, 1444.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-10-16)), frame: (233.5, 1444.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-10-17)), frame: (279.5, 1444.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-10-18)), frame: (5.0, 1500.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-10-19)), frame: (50.5, 1500.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-10-20)), frame: (96.5, 1500.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-10-21)), frame: (142.0, 1500.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-10-22)), frame: (188.0, 1500.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-10-23)), frame: (233.5, 1500.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-10-24)), frame: (279.5, 1500.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-10-25)), frame: (5.0, 1555.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-10-26)), frame: (50.5, 1555.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-10-27)), frame: (96.5, 1555.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-10-28)), frame: (142.0, 1555.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-10-29)), frame: (188.0, 1555.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-10-30)), frame: (233.5, 1555.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-10-31)), frame: (279.5, 1555.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.monthHeader(2020-11)), frame: (0.0, 1626.5, 320.0, 50.0)]",
      "[itemType: .layoutItemType(.day(2020-11-01)), frame: (5.0, 1706.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-11-02)), frame: (50.5, 1706.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-11-03)), frame: (96.5, 1706.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-11-04)), frame: (142.0, 1706.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-11-05)), frame: (188.0, 1706.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-11-06)), frame: (233.5, 1706.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-11-07)), frame: (279.5, 1706.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-11-08)), frame: (5.0, 1762.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-11-09)), frame: (50.5, 1762.0, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-11-10)), frame: (96.5, 1762.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-11-11)), frame: (142.0, 1762.0, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-11-12)), frame: (188.0, 1762.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-11-13)), frame: (233.5, 1762.0, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-11-14)), frame: (279.5, 1762.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-11-15)), frame: (5.0, 1818.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-11-16)), frame: (50.5, 1818.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-11-17)), frame: (96.5, 1818.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-11-18)), frame: (142.0, 1818.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-11-19)), frame: (188.0, 1818.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-11-20)), frame: (233.5, 1818.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-11-21)), frame: (279.5, 1818.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-11-22)), frame: (5.0, 1873.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-11-23)), frame: (50.5, 1873.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-11-24)), frame: (96.5, 1873.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-11-25)), frame: (142.0, 1873.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-11-26)), frame: (188.0, 1873.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-11-27)), frame: (233.5, 1873.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-11-28)), frame: (279.5, 1873.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-11-29)), frame: (5.0, 1929.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-11-30)), frame: (50.5, 1929.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.monthHeader(2020-12)), frame: (0.0, 2000.0, 320.0, 50.0)]",
      "[itemType: .layoutItemType(.day(2020-12-01)), frame: (96.5, 2080.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-12-02)), frame: (142.0, 2080.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-12-03)), frame: (188.0, 2080.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-12-04)), frame: (233.5, 2080.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-12-05)), frame: (279.5, 2080.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-12-06)), frame: (5.0, 2135.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-12-07)), frame: (50.5, 2135.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-12-08)), frame: (96.5, 2135.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-12-09)), frame: (142.0, 2135.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-12-10)), frame: (188.0, 2135.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-12-11)), frame: (233.5, 2135.5, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-12-12)), frame: (279.5, 2135.5, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-12-13)), frame: (5.0, 2191.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-12-14)), frame: (50.5, 2191.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-12-15)), frame: (96.5, 2191.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-12-16)), frame: (142.0, 2191.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-12-17)), frame: (188.0, 2191.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-12-18)), frame: (233.5, 2191.5, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-12-19)), frame: (279.5, 2191.5, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-12-20)), frame: (5.0, 2247.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-12-21)), frame: (50.5, 2247.0, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-12-22)), frame: (96.5, 2247.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-12-23)), frame: (142.0, 2247.0, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-12-24)), frame: (188.0, 2247.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-12-25)), frame: (233.5, 2247.0, 36.0, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-12-26)), frame: (279.5, 2247.0, 35.5, 36.0)]",
      "[itemType: .layoutItemType(.day(2020-12-27)), frame: (5.0, 2303.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-12-28)), frame: (50.5, 2303.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-12-29)), frame: (96.5, 2303.0, 35.5, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-12-30)), frame: (142.0, 2303.0, 36.0, 35.5)]",
      "[itemType: .layoutItemType(.day(2020-12-31)), frame: (188.0, 2303.0, 35.5, 35.5)]",
    ]

    XCTAssert(
      visibleItems.map { $0.description } == expectedVisibleItems,
      "Unexpected visible items.")
  }

  func testHorizontalVisibleItemsForAccessibility() {
    let visibleItems = horizontalVisibleItemsProvider.visibleItemsForAccessibilityElements(
      surroundingPreviouslyVisibleLayoutItem: LayoutItem(
        itemType: .monthHeader(Month(era: 1, year: 2020, month: 02, isInGregorianCalendar: true)),
        frame: CGRect(x: 1000, y: 0, width: 300, height: 50)),
      visibleMonthRange: .init(
        uncheckedBounds: (
          lower: Month(era: 1, year: 2020, month: 01, isInGregorianCalendar: true),
          upper: Month(era: 1, year: 2020, month: 03, isInGregorianCalendar: true))))

    let expectedVisibleItems = [
      "[itemType: .layoutItemType(.monthHeader(2020-01)), frame: (685.0, 0.0, 300.0, 50.0)]",
      "[itemType: .layoutItemType(.day(2020-01-01)), frame: (818.5, 133.0, 33.0, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-01-02)), frame: (861.5, 133.0, 33.0, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-01-03)), frame: (904.5, 133.0, 32.5, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-01-04)), frame: (947.0, 133.0, 33.0, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-01-05)), frame: (690.0, 185.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-01-06)), frame: (733.0, 185.5, 32.5, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-01-07)), frame: (775.5, 185.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-01-08)), frame: (818.5, 185.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-01-09)), frame: (861.5, 185.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-01-10)), frame: (904.5, 185.5, 32.5, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-01-11)), frame: (947.0, 185.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-01-12)), frame: (690.0, 238.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-01-13)), frame: (733.0, 238.5, 32.5, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-01-14)), frame: (775.5, 238.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-01-15)), frame: (818.5, 238.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-01-16)), frame: (861.5, 238.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-01-17)), frame: (904.5, 238.5, 32.5, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-01-18)), frame: (947.0, 238.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-01-19)), frame: (690.0, 291.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-01-20)), frame: (733.0, 291.5, 32.5, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-01-21)), frame: (775.5, 291.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-01-22)), frame: (818.5, 291.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-01-23)), frame: (861.5, 291.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-01-24)), frame: (904.5, 291.5, 32.5, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-01-25)), frame: (947.0, 291.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-01-26)), frame: (690.0, 344.5, 33.0, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-01-27)), frame: (733.0, 344.5, 32.5, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-01-28)), frame: (775.5, 344.5, 33.0, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-01-29)), frame: (818.5, 344.5, 33.0, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-01-30)), frame: (861.5, 344.5, 33.0, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-01-31)), frame: (904.5, 344.5, 32.5, 32.5)]",
      "[itemType: .layoutItemType(.monthHeader(2020-02)), frame: (1000.0, 0.0, 300.0, 50.0)]",
      "[itemType: .layoutItemType(.day(2020-02-01)), frame: (1262.0, 133.0, 33.0, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-02-02)), frame: (1005.0, 185.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-02-03)), frame: (1048.0, 185.5, 32.5, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-02-04)), frame: (1090.5, 185.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-02-05)), frame: (1133.5, 185.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-02-06)), frame: (1176.5, 185.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-02-07)), frame: (1219.5, 185.5, 32.5, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-02-08)), frame: (1262.0, 185.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-02-09)), frame: (1005.0, 238.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-02-10)), frame: (1048.0, 238.5, 32.5, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-02-11)), frame: (1090.5, 238.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-02-12)), frame: (1133.5, 238.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-02-13)), frame: (1176.5, 238.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-02-14)), frame: (1219.5, 238.5, 32.5, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-02-15)), frame: (1262.0, 238.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-02-16)), frame: (1005.0, 291.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-02-17)), frame: (1048.0, 291.5, 32.5, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-02-18)), frame: (1090.5, 291.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-02-19)), frame: (1133.5, 291.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-02-20)), frame: (1176.5, 291.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-02-21)), frame: (1219.5, 291.5, 32.5, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-02-22)), frame: (1262.0, 291.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-02-23)), frame: (1005.0, 344.5, 33.0, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-02-24)), frame: (1048.0, 344.5, 32.5, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-02-25)), frame: (1090.5, 344.5, 33.0, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-02-26)), frame: (1133.5, 344.5, 33.0, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-02-27)), frame: (1176.5, 344.5, 33.0, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-02-28)), frame: (1219.5, 344.5, 32.5, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-02-29)), frame: (1262.0, 344.5, 33.0, 32.5)]",
      "[itemType: .layoutItemType(.monthHeader(2020-03)), frame: (1315.0, 0.0, 300.0, 50.0)]",
      "[itemType: .layoutItemType(.day(2020-03-01)), frame: (1320.0, 133.0, 33.0, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-03-02)), frame: (1363.0, 133.0, 32.5, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-03-03)), frame: (1405.5, 133.0, 33.0, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-03-04)), frame: (1448.5, 133.0, 33.0, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-03-05)), frame: (1491.5, 133.0, 33.0, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-03-06)), frame: (1534.5, 133.0, 32.5, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-03-07)), frame: (1577.0, 133.0, 33.0, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-03-08)), frame: (1320.0, 185.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-03-09)), frame: (1363.0, 185.5, 32.5, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-03-10)), frame: (1405.5, 185.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-03-11)), frame: (1448.5, 185.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-03-12)), frame: (1491.5, 185.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-03-13)), frame: (1534.5, 185.5, 32.5, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-03-14)), frame: (1577.0, 185.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-03-15)), frame: (1320.0, 238.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-03-16)), frame: (1363.0, 238.5, 32.5, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-03-17)), frame: (1405.5, 238.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-03-18)), frame: (1448.5, 238.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-03-19)), frame: (1491.5, 238.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-03-20)), frame: (1534.5, 238.5, 32.5, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-03-21)), frame: (1577.0, 238.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-03-22)), frame: (1320.0, 291.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-03-23)), frame: (1363.0, 291.5, 32.5, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-03-24)), frame: (1405.5, 291.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-03-25)), frame: (1448.5, 291.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-03-26)), frame: (1491.5, 291.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-03-27)), frame: (1534.5, 291.5, 32.5, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-03-28)), frame: (1577.0, 291.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-03-29)), frame: (1320.0, 344.5, 33.0, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-03-30)), frame: (1363.0, 344.5, 32.5, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-03-31)), frame: (1405.5, 344.5, 33.0, 32.5)]",
      "[itemType: .layoutItemType(.monthHeader(2020-04)), frame: (1630.0, 0.0, 300.0, 50.0)]",
      "[itemType: .layoutItemType(.day(2020-04-01)), frame: (1763.5, 133.0, 33.0, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-04-02)), frame: (1806.5, 133.0, 33.0, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-04-03)), frame: (1849.5, 133.0, 32.5, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-04-04)), frame: (1892.0, 133.0, 33.0, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-04-05)), frame: (1635.0, 185.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-04-06)), frame: (1678.0, 185.5, 32.5, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-04-07)), frame: (1720.5, 185.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-04-08)), frame: (1763.5, 185.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-04-09)), frame: (1806.5, 185.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-04-10)), frame: (1849.5, 185.5, 32.5, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-04-11)), frame: (1892.0, 185.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-04-12)), frame: (1635.0, 238.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-04-13)), frame: (1678.0, 238.5, 32.5, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-04-14)), frame: (1720.5, 238.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-04-15)), frame: (1763.5, 238.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-04-16)), frame: (1806.5, 238.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-04-17)), frame: (1849.5, 238.5, 32.5, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-04-18)), frame: (1892.0, 238.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-04-19)), frame: (1635.0, 291.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-04-20)), frame: (1678.0, 291.5, 32.5, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-04-21)), frame: (1720.5, 291.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-04-22)), frame: (1763.5, 291.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-04-23)), frame: (1806.5, 291.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-04-24)), frame: (1849.5, 291.5, 32.5, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-04-25)), frame: (1892.0, 291.5, 33.0, 33.0)]",
      "[itemType: .layoutItemType(.day(2020-04-26)), frame: (1635.0, 344.5, 33.0, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-04-27)), frame: (1678.0, 344.5, 32.5, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-04-28)), frame: (1720.5, 344.5, 33.0, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-04-29)), frame: (1763.5, 344.5, 33.0, 32.5)]",
      "[itemType: .layoutItemType(.day(2020-04-30)), frame: (1806.5, 344.5, 33.0, 32.5)]",
    ]

    XCTAssert(
      visibleItems.map { $0.description } == expectedVisibleItems,
      "Unexpected visible items.")
  }

  // MARK: Private

  private static let calendar = Calendar(identifier: .gregorian)

  private static let dateRange = ClosedRange(
    uncheckedBounds: (
      lower: calendar.startDate(
        of: Day(month: Month(era: 1, year: 2020, month: 01, isInGregorianCalendar: true), day: 01)),
      upper: calendar.startDate(
        of: Day(
          month: Month(era: 1, year: 2020, month: 12, isInGregorianCalendar: true),
          day: 15))))

  private static let size = CGSize(width: 320, height: 480)

  private var verticalVisibleItemsProvider = VisibleItemsProvider(
    calendar: calendar,
    content: makeContent(
      fromBaseContent: CalendarViewContent(
        calendar: calendar,
        visibleDateRange: dateRange,
        monthsLayout: .vertical(pinDaysOfWeekToTop: false))),
    size: size,
    scale: 2,
    monthHeaderHeight: 50)

  private var verticalPinnedDaysOfWeekVisibleItemsProvider = VisibleItemsProvider(
    calendar: calendar,
    content: makeContent(
      fromBaseContent: CalendarViewContent(
        calendar: calendar,
        visibleDateRange: dateRange,
        monthsLayout: .vertical(pinDaysOfWeekToTop: true))),
    size: size,
    scale: 2,
    monthHeaderHeight: 50)

  private var horizontalVisibleItemsProvider = VisibleItemsProvider(
    calendar: calendar,
    content: makeContent(
      fromBaseContent: CalendarViewContent(
        calendar: calendar,
        visibleDateRange: dateRange,
        monthsLayout: .horizontal(monthWidth: 300))),
    size: size,
    scale: 2,
    monthHeaderHeight: 50)

  private static var mockCalendarItem: AnyCalendarItem {
    CalendarItem<UIView, Int>(
      viewModel: 0,
      styleID: "",
      buildView: { UIView(frame: .zero) },
      updateViewModel: { _, _ in })
  }

  private static func makeContent(
    fromBaseContent baseContent: CalendarViewContent)
    -> CalendarViewContent
  {
    baseContent
      .withMonthDayInsets(UIEdgeInsets(top: 30, left: 5, bottom: 0, right: 5))
      .withInterMonthSpacing(15)
      .withVerticalDayMargin(20)
      .withHorizontalDayMargin(10)
      .withMonthHeaderItemProvider  { _ in mockCalendarItem }
      .withDayOfWeekItemProvider { _, _ in mockCalendarItem }
      .withDayItemProvider { _ in mockCalendarItem }
      .withDayRangeItemProvider(
        for: [
          calendar.date(from: DateComponents(year: 2020, month: 03, day: 11))!
            ...
          calendar.date(from: DateComponents(year: 2020, month: 04, day: 05))!,

          calendar.date(from: DateComponents(year: 2020, month: 04, day: 30))!
            ...
          calendar.date(from: DateComponents(year: 2020, month: 05, day: 14))!,
        ],
        { _ in mockCalendarItem })
      .withOverlayItemProvider(
        for: [
          .day(
            containingDate: calendar.date(from: DateComponents(year: 2020, month: 01, day: 19))!),
          .monthHeader(
            monthContainingDate: calendar.date(from: DateComponents(year: 2020, month: 11))!),
        ],
        { _ in mockCalendarItem })
  }

}

// MARK: VisibleCalendarItem+CustomStringConvertible

extension VisibleCalendarItem: CustomStringConvertible {

  public var description: String {
    let itemTypeText: String
    switch itemType {
    case .layoutItemType(let layoutItemType):
      itemTypeText = layoutItemType.description
    case .pinnedDayOfWeek(let position):
      itemTypeText = ".pinnedDayOfWeek(\(position))"
    case .dayRange(let dayRange):
      itemTypeText = ".dayRange(\(dayRange.lowerBound), \(dayRange.upperBound))"
    case .overlayItem(let overlaidItemLocation):
      let calendar = Calendar(identifier: .gregorian)
      let itemLocationText: String
      switch overlaidItemLocation {
      case .day(let date):
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        itemLocationText = ".day(\(year)-\(month)-\(day))"
      case .monthHeader(let date):
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        itemLocationText = ".monthHeader(\(year)-\(month))"
      }
      itemTypeText = ".overlayItem(\(itemLocationText))"
    }

    let frameText = frame.alignedToPixels(forScreenWithScale: 2).debugDescription
    return "[itemType: \(itemTypeText), frame: \(frameText)]"
  }

}

// MARK: LayoutItem+CustomStringConvertible

extension LayoutItem: CustomStringConvertible {

  public var description: String {
    let frameText = frame.alignedToPixels(forScreenWithScale: 2).debugDescription
    return "[itemType: \(itemType.description), frame: \(frameText)]"
  }

}

// MARK: LayoutItem.ItemType+CustomStringConvertible

extension LayoutItem.ItemType: CustomStringConvertible {

  public var description: String {
    switch self {
    case .monthHeader(let month):
      return ".layoutItemType(.monthHeader(\(month.description)))"
    case let .dayOfWeekInMonth(position, month):
      return ".layoutItemType(.dayOfWeekInMonth(\(position.description), \(month.description)))"
    case .day(let day):
      return ".layoutItemType(.day(\(day)))"
    }
  }

}

// MARK: DayOfWeekPosition+CustomStringConvertible

extension DayOfWeekPosition: CustomStringConvertible {

  public var description: String {
    switch self {
    case .first: return ".first"
    case .second: return ".second"
    case .third: return ".third"
    case .fourth: return ".fourth"
    case .fifth: return ".fifth"
    case .sixth: return ".sixth"
    case .last: return ".last"
    }
  }

}
