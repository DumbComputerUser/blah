# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: src/proto/grpc/testing/benchmark_service.proto for package 'grpc.testing'
# Original file comments:
# Copyright 2015 gRPC authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# An integration test service that covers all the method signature permutations
# of unary/streaming requests/responses.

require 'grpc'
require 'src/proto/grpc/testing/benchmark_service_pb'

module Grpc
  module Testing
    module BenchmarkService
      class Service

        include ::GRPC::GenericService

        self.marshal_class_method = :encode
        self.unmarshal_class_method = :decode
        self.service_name = 'grpc.testing.BenchmarkService'

        # One request followed by one response.
        # The server returns the client payload as-is.
        rpc :UnaryCall, ::Grpc::Testing::SimpleRequest, ::Grpc::Testing::SimpleResponse
        # Repeated sequence of one request followed by one response.
        # Should be called streaming ping-pong
        # The server returns the client payload as-is on each response
        rpc :StreamingCall, stream(::Grpc::Testing::SimpleRequest), stream(::Grpc::Testing::SimpleResponse)
        # Single-sided unbounded streaming from client to server
        # The server returns the client payload as-is once the client does WritesDone
        rpc :StreamingFromClient, stream(::Grpc::Testing::SimpleRequest), ::Grpc::Testing::SimpleResponse
        # Single-sided unbounded streaming from server to client
        # The server repeatedly returns the client payload as-is
        rpc :StreamingFromServer, ::Grpc::Testing::SimpleRequest, stream(::Grpc::Testing::SimpleResponse)
        # Two-sided unbounded streaming between server to client
        # Both sides send the content of their own choice to the other
        rpc :StreamingBothWays, stream(::Grpc::Testing::SimpleRequest), stream(::Grpc::Testing::SimpleResponse)
        # Get the memory usage of process before server is made
        rpc :GetBeforeSnapshot, ::Grpc::Testing::SimpleRequest, ::Grpc::Testing::MemorySize
      end

      Stub = Service.rpc_stub_class
    end
  end
end
