cpp/${remoteClass.name}.hpp
/* Autogenerated with Kurento Idl */

#ifndef __${camelToUnderscore(remoteClass.name)}_HPP__
#define __${camelToUnderscore(remoteClass.name)}_HPP__

#include <jsoncpp/json/json.h>
#include <JsonRpcException.hpp>
#include <ObjectRegistrar.hpp>
#include <memory>
#include <vector>

<#if (remoteClass.extends)??>
#include "${remoteClass.extends.name}.hpp"
</#if>

namespace kurento {

<#list remoteClassDependencies(remoteClass) as dependency>
class ${dependency.name};
</#list>

class ${remoteClass.name}<#if remoteClass.extends??> : public virtual ${remoteClass.extends.name}</#if>
{

public:

  ${remoteClass.name} () {};
  virtual ~${remoteClass.name} () {};
  <#list remoteClass.methods as method><#rt>
  <#if method_index = 0 >

  </#if>
  virtual ${getCppObjectType(method.return,false)} ${method.name} (<#rt>
      <#lt><#list method.params as param>${getCppObjectType(param.type.name)} ${param.name}<#if param_has_next>, </#if></#list>) {throw "Not implemented";};
  </#list>

  class Factory : public virtual kurento::Factory
  {
  public:
    Factory () {};

    virtual std::shared_ptr<MediaObject> createObject (const Json::Value
        &params) throw (JsonRpc::CallException);

    virtual std::string getName () {
      return "${remoteClass.name}";
    };

  private:

    <#list remoteClass.constructors as constructor><#rt>
    std::shared_ptr<MediaObject> createObject (<#rt>
     <#lt><#list constructor.params as param><#rt>
        <#lt>${getCppObjectType(param.type.name)} ${param.name}<#rt>
        <#lt><#if param_has_next>, </#if><#rt>
     <#lt></#list>);
    </#list>

    class StaticConstructor
    {
    public:
      StaticConstructor();
    };

    static StaticConstructor staticConstructor;

  };

  class Invoker<#if remoteClass.extends??> : public virtual ${remoteClass.extends.name}::Invoker</#if>
  {
  public:
    Invoker() {};
    virtual void invoke (std::shared_ptr<MediaObject> obj,
        const std::string &methodName, const Json::Value &params,
        Json::Value &response) throw (JsonRpc::CallException);
  };

  virtual <#if remoteClass.extends??>MediaObject::</#if>Invoker &getInvoker() {
    return invoker;
  }

  private:
    Invoker invoker;

};

} /* kurento */

#endif /*  __${camelToUnderscore(remoteClass.name)}_HPP__ */
