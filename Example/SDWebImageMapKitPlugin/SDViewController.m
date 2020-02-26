//
//  SDViewController.m
//  SDWebImageMapKitPlugin
//
//  Created by lizhuoli1126@126.com on 02/26/2020.
//  Copyright (c) 2020 lizhuoli1126@126.com. All rights reserved.
//

#import "SDViewController.h"
@import MapKit;
@import SDWebImage;
@import SDWebImageMapKitPlugin;

NSString * const kAnnotationBase64URL = @"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAABmJLR0QA/wD/AP+gvaeTAAACMElEQVRoge2Zz0sUYRyHn3dmKTLQWbcfdNkyhKKtjiF4ErSLQSeJztmhW4TQHxESEV42PS4pnoPYhQ5Cl2DBLhYktAURSRIuS2o7M98OY2jqLq7vO7we3uc0P97vfN5n5n1fXhhw2EWZfqDc7S8Qx+PACHBh63INoYx402p+eclknjEBGSscw9uYBHkA+C2aRYhMEfROqGK1aSLXiEDS+fVXwDC+D31XIX8ZenKwtgpv5nYVUCHIjpqQyOg+ACB58wxz4iQM3obg9PY9kb3tFSOs/XoCPNSN1v4CW2P+Pb7vM3Qn6fx6AxYXYKUGzZYvOYToupr78kEn39MpBiCO7wM+fde2O18pwbdP7ToPkAF/XDdeXyBZbSB/KTlbXIA/GwetvakbbkIgD0B3LjlbqXVSe1433MQkTmZpfTWZsO2Hzf61GpgQ+AoU9iyVB6/VQn8ICeXD16rXuvEGBLxpIDpEZYgfzejGawuo+eUlRKY6LhSeq5e1j7r5JlYhCHonECodVJQJso9NRBsRUMVqkyA7CjwDwjZNQ4Sn9GRvHanN3E5krP8KXnzv96mLj47XvwOw2X2Orp+fJyGc0d067Ma4wD/evvvx3xo/eONsKllm5oBFnIBtnIBtnIBtnIBtnIBtnIBtnIBtnIBtnIBtnIBtnEArlKK637Fp0vwCL3YcF9MKSU1gs0uVgDpCw4sys2nlpCYwVDjTAGYFSgMDuXpaOWb+E7cgjr3Uho7jqPAXHziYp4fwTesAAAAASUVORK5CYII=";

@interface SDAnnotation : NSObject<MKAnnotation>

@property (nonatomic, readwrite) CLLocationCoordinate2D coordinate;
@property (nonatomic, readwrite, copy, nullable) NSString *title;
@property (nonatomic, readwrite, copy, nullable) NSString *subtitle;

@end

@implementation SDAnnotation

@end

@interface SDViewController () <MKMapViewDelegate>

@property (nonatomic, strong) MKMapView *mapView;

@end

@implementation SDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    MKMapView *mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    self.mapView = mapView;
    mapView.mapType = MKMapTypeStandard;
    mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    mapView.delegate = self;
    
    CLLocationCoordinate2D location1 = CLLocationCoordinate2DMake(39.92, 116.46);
    SDAnnotation *annotation1 = [[SDAnnotation alloc] init];
    annotation1.title = @"Beijing";
    annotation1.subtitle = @"Beijing City";
    annotation1.coordinate = location1;
    [mapView addAnnotation:annotation1];
    
    CLLocationCoordinate2D location2= CLLocationCoordinate2DMake(31.22, 121.48);
    SDAnnotation *annotation2 = [[SDAnnotation alloc] init];
    annotation2.title = @"Shanghai";
    annotation2.subtitle = @"Shanghai City";
    annotation2.coordinate = location2;
    [mapView addAnnotation:annotation2];
    [self.view addSubview:mapView];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    if ([annotation isKindOfClass:[SDAnnotation class]]) {
        static NSString * key1 = @"Annotation";
        MKAnnotationView * annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:key1];
        if (!annotationView) {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:key1];
            annotationView.canShowCallout = true;
            annotationView.calloutOffset = CGPointMake(0, 0);
        }
        annotationView.annotation = annotation;
        [annotationView sd_setImageWithURL:[NSURL URLWithString:kAnnotationBase64URL]];
        return annotationView;
    } else {
        return nil;
    }
}


@end
