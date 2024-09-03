import UIKit
import SwiftUI


// Battleship

typealias Position = CGPoint
typealias Distance = CGFloat

func inRange1(target: Position, range: Distance) -> Bool {
	return sqrt(target.x * target.x + target.y * target.y) <= range
}

func inRange2(target: Position, ownPosition: Position, range: Distance) -> Bool {
	let dx = ownPosition.x - target.x
	let dy = ownPosition.y - target.y

    let targetDistance = sqrt(dx * dx + dy * dy)

    return targetDistance <= range
}

let minimumDistance: Distance = 2.0

func inRange3(
    target: Position,
    ownPosition: Position,
    range: Distance
) -> Bool {
    let dx = ownPosition.x - target.x
    let dy = ownPosition.y - target.y

    let targetDistance = sqrt(dx * dx + dy * dy)
    
    return targetDistance > minimumDistance && targetDistance <= range
}

func inRange4(
    target: Position,
    ownPosition: Position,
    friendly: Position,
    range: Distance
) -> Bool {
    let dx = ownPosition.x - target.x
    let dy = ownPosition.x - target.y

    let targetDistance = sqrt(dx * dx + dy * dy)

    let friendlyDx = friendly.x - target.x
    let friendlyDy = friendly.y - target.y

    let friendlyDistance = sqrt(friendlyDx * friendlyDx + friendlyDy * friendlyDy)

    return targetDistance <= range
        && targetDistance > minimumDistance
        && (friendlyDistance > minimumDistance)
}


// Refactor
typealias Region = (Position) -> Bool

func circle(radius: Distance) -> Region {
    return { point in
        sqrt(point.x * point.x + point.y * point.y) <= radius
    }
}

func circle2(radius: Distance, center: Position) -> Region {
    return { point in
        let shiftedPoint = Position(x: point.x - center.x,
                                    y: point.y - center.y
        )
        return sqrt(shiftedPoint.x * shiftedPoint.x +
                    shiftedPoint.y * shiftedPoint.y) <= radius
    }
}

func shift(offset: Position, region: @escaping Region) -> Region {
    return { point in
        let shiftedPoint = Position(x: point.x - offset.x,
                                    y: point.y - offset.y
        )

        return region(shiftedPoint)
    }
}

func invert(region: @escaping Region) -> Region {
    return { point in !region(point) }
}

func intersection(region1: @escaping Region, region2: @escaping Region) -> Region {
    return { point in region1(point) && region2(point) }
}

func union(region1: @escaping Region, region2: @escaping Region) -> Region {
    return { point in region1(point) || region2(point) }
}

func difference(region: @escaping Region, minusRegion: @escaping Region) -> Region {
    return intersection(region1: region, region2: invert(region: minusRegion))
}

func inRangeF(ownPosition: Position, target: Position, friendly: Position, range: Distance) -> Bool {
    let rangeRegion = difference(
        region: circle(radius: range),
        minusRegion: circle(radius: minimumDistance)
    )

    let targetRegion = shift(offset: ownPosition, region: rangeRegion)
    let friendlyRegion = shift(offset: friendly, region: rangeRegion)
    let resultRegion = difference(region: targetRegion, minusRegion: friendlyRegion)

    return resultRegion(target)
}


/// Wrapping core image
///
///
typealias Filter = (CIImage) -> CIImage


func blur(radius: Double) -> Filter {
    return { image in
        let parameters = [
            kCIInputRadiusKey: radius,
            kCIInputImageKey: image
        ]

        let filter = CIFilter(name: "CIGaussianBlur", parameters: parameters)!
        return filter.outputImage!
    }
}

func colorGenerator(color: Color) -> Filter {
    return { _  in
        let parameters = [kCIInputColorKey: color]
        let filter = CIFilter(name: "CIConstantColorGenerator",
                              parameters: parameters
        )!

        return filter.outputImage!
    }
}

func compositeSourceOver(overlay: CIImage) -> Filter {
    return { image in
        let parameters = [
            kCIInputBackgroundImageKey: image,
            kCIInputImageKey: overlay
        ]

        let filter = CIFilter(name: "CISourceOverCompositing",
                              parameters: parameters
        )!

        let cropRect = image.extent
        return filter.outputImage!.cropped(to: cropRect)
    }
}
