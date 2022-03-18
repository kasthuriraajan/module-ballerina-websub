// Copyright (c) 2021 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

public type Payload record {|
    string eventType;
    json eventData;
|};
public type StartupMessage record {
    string hubName;
    string subscriberId;
};

public type EventNotification record {
    string hubName;
    string eventId;
    string message;
};

type CommonResponse record {|
    map<string|string[]> headers?;
    map<string> body?;
|};

public type Acknowledgement record {
    *CommonResponse;
};

public type Error distinct error<CommonResponse>;
public type ListenerError distinct Error;
public type StartupError distinct Error;

public type CustomWebhookService service object {
    remote function onStartup(StartupMessage message) returns Acknowledgement|StartupError?;

    remote function onEvent(EventNotification message) returns Acknowledgement?;
};
