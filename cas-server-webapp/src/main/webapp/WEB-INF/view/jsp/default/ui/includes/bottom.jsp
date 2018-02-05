<%--

    Licensed to Apereo under one or more contributor license
    agreements. See the NOTICE file distributed with this work
    for additional information regarding copyright ownership.
    Apereo licenses this file to you under the Apache License,
    Version 2.0 (the "License"); you may not use this file
    except in compliance with the License.  You may obtain a
    copy of the License at the following location:

      http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.

--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</div> <!-- END #content -->

<c:if test="${empty serviceParam}">
    <c:set var="serviceParam" value="&service=${osfLoginContext.isServiceUrl() ? osfLoginContext.getServiceUrl() : ''}"/>
</c:if>

<div class="bottom-link">
    <br/>
    <c:if test="${linkSignIn}">
        <spring:eval var="osfLoginUrl" expression="@casProperties.getProperty('cas.osf.login.url')"/>
        <a id="link-sign-in" href="${osfLoginUrl}${serviceParam}"><spring:message
                code="screen.general.link.signIn"/></a>
        <span style="padding: 25px"></span>
    </c:if>
    <c:if test="${linkSignOut}">
        <spring:eval var="casLogoutUrl" expression="@casProperties.getProperty('cas.logout.url')"/>
        <a id="link-sign-out" href="${casLogoutUrl}?${serviceParam}"><spring:message
                code="screen.general.link.signOut"/></a>
        <span style="padding: 25px"></span>
    </c:if>
    <c:if test="${linkCreateAccount}">
        <spring:eval var="createAccountUrl" expression="@casProperties.getProperty('osf.createAccount.url')"/>
        <span><a id="link-create-account"
                 href="${createAccountUrl}${registeredService.properties.registerUrl.getValue()}"><spring:message
                code="screen.general.link.createAccount"/></a></span>
        <span style="padding: 25px"></span>
    </c:if>
    <c:if test="${linkBackToOsf}">
        <spring:eval var="osfUrl" expression="@casProperties.getProperty('osf.url')"/>
        <span><a id="link-back-to-osf" href="${osfUrl}"><spring:message
                code="screen.general.link.backToOsf"/></a></span>
    </c:if>
    <br/>
</div>

<footer>
    <div class="copyright">
        <div class="row">
            <p>Copyright &copy; 2011-2018 <a href="https://cos.io">Center for Open Science</a> |
                <a href="https://github.com/CenterForOpenScience/centerforopenscience.org/blob/master/TERMS_OF_USE.md">Terms
                    of Use</a> |
                <a href="https://github.com/CenterForOpenScience/centerforopenscience.org/blob/master/PRIVACY_POLICY.md">Privacy
                    Policy</a>
            </p>
        </div>
    </div>
</footer>

</div> <!-- END #container -->

<script>
    function selectFocus() {
        var username = document.getElementById("username")
        if (username) {
            username.focus();
        }
        var institutionSelect = document.getElementById("institution-form-select")
        if (institutionSelect) {
            institutionSelect.focus();
        }
    }
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/headjs/1.0.3/head.min.js"></script>
<spring:theme code="cas.javascript.file" var="casJavascriptFile" text=""/>
<script type="text/javascript" src="<c:url value="${casJavascriptFile}" />"></script>
<spring:eval var="googleAnalyticsId" expression="@casProperties.getProperty('google.analytics.id')"/>
<c:if test="${not empty googleAnalyticsId}">
    <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r;
            i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date();
            a = s.createElement(o),
                m = s.getElementsByTagName(o)[0];
            a.async = 1;
            a.src = g;
            m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

        ga('create', "${googleAnalyticsId}", 'auto', {'allowLinker': true});
        ga('require', 'linker');
        <spring:eval var="googleAutoLink" expression="@casProperties.getProperty('google.analytics.autoLink')" />
        <c:if test="${not empty googleAutoLink}">
        ga('linker:autoLink', ['${googleAutoLink}']);
        </c:if>
        ga('send', 'pageview');
    </script>
</c:if>

</body>

</html>
