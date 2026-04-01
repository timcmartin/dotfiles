#!/bin/bash

# prepare to instigate pipelines for each uni app
open https://gitlab.getty.cloud/unisporkal/asset-detail-app/pipelines/new
open https://gitlab.getty.cloud/unisporkal/account-app/pipelines/new
open https://gitlab.getty.cloud/unisporkal/collaboration-app/pipelines/new
open https://gitlab.getty.cloud/unisporkal/landing-app/pipelines/new
open https://gitlab.getty.cloud/unisporkal/misc-admin-app/pipelines/new
open https://gitlab.getty.cloud/unisporkal/purchase-app/pipelines/new
open https://gitlab.getty.cloud/unisporkal/search-app/pipelines/new
open https://gitlab.getty.cloud/unisporkal/sign-in-app/pipelines/new
# open release monitoring dashboards
open "https://grafana.prod-getty.cloud/d/EeiXFvD7k/unisporkal-release-dashboard?orgId=1"
open "https://grafana.prod-getty.cloud/dashboards/f/unisporkal/unisporkal"
open "https://grafana.prod-getty.cloud/dashboards/f/fe95642e-f715-4978-a08d-d6c7607e56a9/unisporkal-custom"
open "https://splunk.getty.cloud/en-US/app/gi_ops_noc_web/incident_manager_metric_tracking?form.field1.earliest=-60m%40m&form.field1.latest=now&hideFilters=false&form.bots=false"
open "https://splunk.getty.cloud/en-US/app/gi_appdev_unisporkal_web/unisporkal_release_monitoring"
open "https://splunk.getty.cloud/en-US/app/gi_appdev_unisporkal_web/release_dashboard_-_unisporkal?form.service=account"
open "https://splunk.getty.cloud/en-US/app/gi_appdev_unisporkal_web/release_dashboard_-_unisporkal?form.service=collaboration"
open "https://splunk.getty.cloud/en-US/app/gi_appdev_unisporkal_web/release_dashboard_-_unisporkal?form.service=landing"
open "https://splunk.getty.cloud/en-US/app/gi_appdev_unisporkal_web/release_dashboard_-_unisporkal?form.service=search"
open "https://splunk.getty.cloud/en-US/app/gi_appdev_unisporkal_web/release_dashboard_-_unisporkal?form.service=sign-in"
