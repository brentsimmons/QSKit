# Q Branch Standard Kit

by [Q Branch](http://qbranch.co/)

## Low-level code with tests

QSKit is a collection of categories and utilities that we use in our software. The project includes unit tests so we can build on a solid foundation.

None of it is high-tech. It’s just some basics, our standard kit.

### Not a framework

Any given app may not need everything, and so we don’t build it as a framework. Instead, an app uses exactly what’s needed. (But note that some things may depend on other things.)

### What’s in it

#### Categories

Category methods are prefixed with `qs_`. This isn’t beautiful, but it does mean our methods won’t collide with Apple’s methods, and it makes it easier to spot category methods.

Many of the categories for collections are for adding or getting objects safely — that is, they won’t throw an exception if a key is nil (for instance).

But there are a bunch of other categories too — `-[NSData qs_hexadecimalString]` and `-[NSNotificationCenter qs_postNotificationNameOnMainThread:object:userInfo:]` are examples.

#### QSIsEmpty

Often you don’t care about the difference between nil and just not containing anything — an empty NSString, an NSArray with zero elements, and so on.

`QSIsEmpty` works with strings, collections, and NSData. It’s convenient, and it makes it clear when you don’t care about that difference.

#### Other things

`QSSAXParser` wraps libxml’s SAX parser. (There’s a `QSOPMLParser` to help you figure out how to use it.)

`QSBlocks` contains some commonly-used block definitions.

`QSPlatform` includes #defines to make writing cross-platform (iOS and Mac) easier.

`QSMath` has functions that work with 32-bit and 64-bit CGFloats.

`QSNode` is a tree representation.

`QSDateParser` is a fast parser for internet dates.

`QSImageRenderer` is a block-based system for rendering images in the background.

`QSScaling` does the math for scaling images (aspect-fit or aspect-fill).

`QSDatabaseQueue` works with FMDB. ([FMDB is available separately](https://github.com/ccgus/fmdb) from Flying Meat.)

`QSHTTPConstants` and friends in the Web group are some of the building blocks for building web services clients.

### How to test

Xcode’s test system wants an app, so there’s a Mac app included. It doesn’t do anything.

Open the project and choose Product > Test (or hit cmd-U) to run the tests.

### Future

We’ll keep adding to QSKit. The kit is forever a work in progress.

### Contact

[Brent Simmons](https://github.com/brentsimmons)<br />
[@brentsimmons](https://twitter.com/brentsimmons)

### License

Q Branch Standard Kit is available under the MIT license. See the LICENSE file for details.

If you use any or all of QSKit in an app, please let us know — we’d like to see your app.